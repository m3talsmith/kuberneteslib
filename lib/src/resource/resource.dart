import 'dart:convert';

import 'package:humanizer/humanizer.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kuberneteslib/src/helpers/yaml_parser.dart';
import 'package:kuberneteslib/src/resource/resource_base.dart';
import 'package:yaml/yaml.dart';

import '../auth/cluster.dart';
import '../auth/exceptions.dart';
import '../helpers/object_meta_converter.dart';
import '../helpers/object_spec_converter.dart';
import '../meta/object_meta.dart';
import '../spec/spec.dart';
import '../status/status.dart';
import 'resource_kind.dart';

part 'resource.g.dart';

/// Represents a Kubernetes resource with full API interaction capabilities.
///
/// The Resource class is the core component for interacting with Kubernetes resources,
/// providing:
/// - CRUD operations (Create, Read, Update, Delete)
/// - Resource listing and filtering
/// - API path management
/// - Serialization/deserialization
///
/// Resources are organized by API groups:
/// - Core API (/api/v1)
/// - Apps API (/apis/apps/v1)
/// - Batch API (/apis/batch/v1)
///
/// Example usage:
/// ```dart
/// // List all pods in the default namespace
/// final pods = await Resource.list(
///   auth: clusterAuth,
///   resourceKind: 'pod',
///   namespace: 'default',
/// );
///
/// // Get a specific deployment
/// final deployment = await Resource.show(
///   auth: clusterAuth,
///   resourceKind: 'deployment',
///   resourceName: 'nginx-deploy',
///   namespace: 'default',
/// );
/// ```
///
/// This class implements [ResourceBase] and works with [ObjectMeta], [Spec],
/// and [Status] to provide a complete representation of Kubernetes resources.
/// See the [Kubernetes API documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/)
/// for more details about specific resource types.
@JsonSerializable()
class Resource implements ResourceBase {
  /// Creates a new Resource instance.
  ///
  /// All fields are optional to support different resource types and use cases.
  Resource({
    this.metadata,
    this.kind,
    this.namespace,
    this.auth,
  });

  /// The API version of the resource.
  @JsonKey(includeIfNull: false)
  String? apiVersion;

  /// Resource metadata including name, labels, annotations, etc.
  @JsonKey(includeIfNull: false)
  @ObjectMetaConverter()
  ObjectMeta? metadata;

  /// Resource specification defining desired state.
  @JsonKey(includeIfNull: false)
  @ObjectSpecConverter()
  Spec? spec;

  /// Current status of the resource.
  @JsonKey(includeIfNull: false)
  Status? status;

  /// The type of resource (e.g., 'Pod', 'Deployment').
  @JsonKey(includeIfNull: false)
  String? kind;

  /// The namespace where this resource exists.
  @JsonKey(includeIfNull: false)
  String? namespace;

  /// Authentication configuration for API operations.
  @JsonKey(includeIfNull: false, fromJson: _authFromJson, includeToJson: false)
  ClusterAuth? auth;

  /// The API path for V1 Core resource types.
  static const coreAPI = '/api/v1';

  /// The API path for V1 Apps resource types.
  static const appsAPI = '/apis/apps/v1';

  /// The API path for V1 Batch resource types.
  static const batchAPI = '/apis/batch/v1';

  static ClusterAuth? _authFromJson(dynamic json) {
    if (json == null) return null;
    if (json is ClusterAuth) {
      return json;
    }
    return ClusterAuth.fromJson(json as Map<String, dynamic>);
  }

  /// [ignoreList] is a list of [ResourceKind] enums to ignore when listing
  /// resources.
  static List<ResourceKind> get ignoreList => ResourceKind.ignoreList;

  /// [ignoreShow] is a list of [ResourceKind] enums to ignore when showing
  /// resources.
  static List<ResourceKind> get ignoreShow => ResourceKind.ignoreShow;

  /// [apiReadKinds] gathers a list of API readable [ResourceKind]s.
  ///
  /// Will return the list sorted by [ResourceKind.name], with [ignoreList]
  static List<ResourceKind> get apiReadKinds => ResourceKind.apiReadKinds;

  /// [getApi] returns the correct API path for a given [resourceKind].
  ///
  /// Current supportes API paths are:
  /// - [coreAPI]
  /// - [appsAPI]
  /// - [batchAPI]
  static String? getApi({required String resourceKind}) {
    switch (ResourceKind.values.firstWhere(
      (e) => e.name.toLowerCase() == resourceKind.toLowerCase(),
      orElse: () => ResourceKind.unknown,
    )) {
      case ResourceKind.unknown:
        return coreAPI;
      case ResourceKind.daemonSet:
      case ResourceKind.deployment:
      case ResourceKind.replicaSet:
      case ResourceKind.statefulSet:
      case ResourceKind.controllerRevision:
        return appsAPI;
      case ResourceKind.cronJob:
      case ResourceKind.job:
        return batchAPI;
      default:
        return coreAPI;
    }
  }

  /// [list] queries the Kubernetes API for a list of [resourceKind].
  ///
  /// [resourceKind] is required and represents the [ResourceKind] of a
  /// Kubernetes resource.
  ///
  /// If an [auth] instance isn't passed, this will throw a
  /// [MissingAuthException].
  ///
  /// [pluralize] (default: true) allows the [resourceKind] to be pluralized for
  /// the API path.
  ///
  /// An optional [namespace] (default: "default") can be passed to narrow the
  /// query to a specific a Kubernetes [namespace].
  ///
  /// [list] will return an empty list if no Kubernetes [Resource] is found in
  /// the Kubernetes API.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// main () async {
  ///   final config = Config.fromYaml('<kubernetes cluster yaml>');
  ///   final auth = ClusterAuth.fromConfig(config);
  ///   await auth.ensureInitialized();
  ///
  ///   final resources = Resource.list({
  ///     auth: auth,
  ///     resourceKind: 'pod',
  ///   });
  /// }
  /// ```
  static Future<List<Resource>> list({
    ClusterAuth? auth,
    required String resourceKind,
    bool pluralize = true,
    String? namespace = 'default',
  }) async {
    if (auth == null) throw MissingAuthException();

    final api = Resource.getApi(resourceKind: resourceKind);

    final resources = <Resource>[];

    var resourceKindPluralized = resourceKind;
    if (pluralize) {
      resourceKindPluralized = resourceKind.toLowerCase().toPluralForm();
    }

    final resourcePath = (namespace != null)
        ? '$api/namespaces/$namespace/$resourceKindPluralized'
        : '$api/$resourceKindPluralized';
    final uri = Uri.parse('${auth.cluster!.server!}$resourcePath');

    final response = await auth.get(uri);
    if (response.statusCode > 299) {
      return [];
    }
    final data = jsonDecode(response.body);

    for (var item in data['items']) {
      /// Adds additional internal tracking for the [ResourceKind] used
      item['kind'] = resourceKind.toSingularForm();

      /// Adds additional internal tracking for the api path used
      item['api'] = api;

      /// Adds additional internal tracking for the [auth] instance used
      item['auth'] = auth;

      /// Adds additional internal tracking for the [namespace] used
      item['namespace'] = namespace;
      item['metadata']?['namespace'] = namespace;

      final resource = Resource.fromJson(item);
      resources.add(resource);
    }
    return resources;
  }

  /// [show] performs a Kubernetes API query to fetch a given [resourceKind] by
  /// [resourceName].
  ///
  /// [resourceName] is required and represents the [Resource.name] of a
  /// Kubernetes resource.
  ///
  /// [resourceKind] is required and represents the [ResourceKind] of a
  /// Kubernetes resource.
  ///
  /// If an [auth] instance isn't passed, this will throw a
  /// [MissingAuthException].
  ///
  /// [pluralize] (default: true) allows the [resourceKind] to be pluralized for
  /// the API path.
  ///
  /// An optional [namespace] (default: "default") can be passed to narrow the
  /// query to a specific a Kubernetes [namespace].
  ///
  /// [show] will return null if no [Resource] is returned from the Kubernetes
  /// API.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// main () async {
  ///   final config = Config.fromYaml('<kubernetes cluster yaml>');
  ///   final auth = ClusterAuth.fromConfig(config);
  ///   await auth.ensureInitialized();
  ///
  ///   final resource = Resource.show({
  ///     auth: auth,
  ///     resourceName: 'example-1234',
  ///     resourceKind: 'pod',
  ///   });
  /// }
  /// ```
  static Future<Resource?> show({
    ClusterAuth? auth,
    required String resourceKind,
    required String resourceName,
    bool pluralize = true,
    String? namespace = 'default',
  }) async {
    if (auth == null) throw MissingAuthException();

    final api = Resource.getApi(resourceKind: resourceKind);

    var resourceKindPluralized = resourceKind;
    if (pluralize) {
      resourceKindPluralized = resourceKind.toLowerCase().toPluralForm();
    }

    final resourcePath = (namespace != null)
        ? '$api/namespaces/$namespace/$resourceKindPluralized/$resourceName'
        : '$api/$resourceKindPluralized/$resourceName';
    final uri = Uri.parse('${auth.cluster!.server!}$resourcePath');

    final response = await auth.get(uri);
    if (response.statusCode > 299) {
      return null;
    }
    final data = jsonDecode(response.body);

    /// Adds additional internal tracking for the [ResourceKind] used
    data['kind'] = resourceKind.toSingularForm();

    /// Adds additional internal tracking for the api path used
    data['api'] = api;

    /// Adds additional internal tracking for the [auth] instance used
    data['auth'] = auth;

    return Resource.fromJson(data);
  }

  static Future<Resource?> create({
    ClusterAuth? auth,
    Resource? resource,
    String? resourceKind,
    Map<String, dynamic>? body,
    bool pluralize = true,
    String? namespace = 'default',
  }) async {
    if (auth == null) throw MissingAuthException();
    if (resource == null && resourceKind == null && body == null) {
      throw ArgumentError('resource, resourceKind, or body is required');
    }

    resource ??= Resource.fromJson(body!);
    resourceKind ??= resource.kind!;

    final api = Resource.getApi(resourceKind: resourceKind);

    var resourceKindPluralized = resourceKind;
    if (pluralize) {
      resourceKindPluralized = resourceKind.toLowerCase().toPluralForm();
    }

    final resourcePath = (namespace != null)
        ? '$api/namespaces/$namespace/$resourceKindPluralized'
        : '$api/$resourceKindPluralized';
    final uri = Uri.parse('${auth.cluster!.server!}$resourcePath');

    final response = await auth.post(uri, body: jsonEncode(resource.toJson()));

    if (response.statusCode > 299) {
      return null;
    }
    final data = jsonDecode(response.body);

    /// Adds additional internal tracking for the [ResourceKind] used
    data['kind'] = resourceKind.toSingularForm();

    /// Adds additional internal tracking for the api path used
    data['api'] = api;

    /// Adds additional internal tracking for the [auth] instance used
    data['auth'] = auth;

    return Resource.fromJson(data);
  }

  Future<Resource?> update() async {
    if (auth == null) throw MissingAuthException();
    if (kind == null) throw ArgumentError('kind is required');

    final api = Resource.getApi(resourceKind: kind!);
    final resourceKindPluralized = kind!.toLowerCase().toPluralForm();

    final resourcePath = (namespace != null)
        ? '$api/namespaces/$namespace/$resourceKindPluralized/${metadata!.name}'
        : '$api/$resourceKindPluralized/${metadata!.name}';
    final uri = Uri.parse('${auth!.cluster!.server!}$resourcePath');

    final response = await auth!.patch(uri, body: jsonEncode(toJson()));

    if (response.statusCode > 299) {
      return null;
    }
    return Resource.fromJson(jsonDecode(response.body));
  }

  Future<Resource?> save() async {
    final resources = await Resource.list(
      auth: auth,
      resourceKind: kind!,
      namespace: namespace,
    );

    Resource? resource;

    final foundResource = resources.firstWhere(
        (r) => r.metadata?.name == metadata?.name,
        orElse: () => Resource());

    if (foundResource.metadata?.name != metadata?.name) {
      resource = await Resource.create(auth: auth, resource: this);
    } else {
      resource = await update();
    }

    return resource;
  }

  /// [delete] queries the Kubernetes API to remove an instance of a resource
  ///
  /// This relies on the internal:
  /// - [kind]
  /// - [metadata.name]
  /// - [api]
  ///
  /// Example usage:
  ///
  /// ```dart
  /// main () async {
  ///   final config = Config.fromYaml('<kubernetes cluster yaml>');
  ///   final auth = ClusterAuth.fromConfig(config);
  ///   await auth.ensureInitialized();
  ///
  ///   final resource = Resource.show({
  ///     auth: auth,
  ///     resourceName: 'example-1234',
  ///     resourceKind: 'pod',
  ///   });
  ///
  ///   await resource.delete();
  /// }
  /// ```
  delete() async {
    if (auth == null) throw MissingAuthException();
    if (kind == null) throw ArgumentError('kind is required');
    namespace ??= (metadata?.namespace ?? 'default');

    final api = Resource.getApi(resourceKind: kind!);

    var resourceKindPluralized = kind!.toLowerCase().toPluralForm();

    final resourcePath =
        '$api/namespaces/$namespace/$resourceKindPluralized/${metadata!.name}';
    final uri = Uri.parse('${auth!.cluster!.server!}$resourcePath');

    final response = await auth!.delete(uri);
    if (response.statusCode > 299) {
      return null;
    }
  }

  static String asKubernetesYaml(Resource resource) {
    return resource.toKubernetesYaml();
  }

  /// Converts a [Resource] to a Kubernetes yaml file
  String toKubernetesYaml() {
    var template = '''
---
apiVersion: v1
kind: $kind
annotations:
  ${metadata != null && metadata!.annotations != null ? json2yaml(metadata!.annotations!) : ''}
labels:
  ${metadata != null && metadata!.labels != null ? json2yaml(metadata!.labels!) : ''}
metadata:
  ${metadata != null ? json2yaml(metadata!.toJson()) : ''}
spec:
  ${spec != null ? json2yaml(spec!.toJson()) : ''}
    ''';
    return template;
  }

  static Resource? fromYaml(String yaml) {
    final yamlMap = loadYaml(yaml);
    if (yamlMap == null) return null;
    final json = fromYamlMap(yamlMap);
    json['kind'] = (json['kind'] as String).toSingularForm().toLowerCase();
    json['spec']['kind'] = json['kind'];
    return Resource.fromJson(json);
  }

  factory Resource.fromJson(Map<String, dynamic> json) {
    json['kind'] ??=
        (json.containsKey('metadata') && json['metadata']!.containsKey('kind'))
            ? json['metadata']['kind']
            : 'unknown';
    return _$ResourceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

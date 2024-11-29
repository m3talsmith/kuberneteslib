import 'dart:convert';

import 'package:humanizer/humanizer.dart';

import '../auth/cluster.dart';
import '../auth/exceptions.dart';
import '../meta/object_meta.dart';
import '../spec/spec.dart';
import '../status/status.dart';
import 'resource_kind.dart';

/// A Resource is the core component of Kubernetes. This gives access to every
/// resource that the Kubernetes API has.
///
class Resource {
  /// Contains the [ObjectMeta] (metadata) for a [Resource].
  late ObjectMeta metadata;

  /// Contains an optional [Spec] for a [Resource].
  Spec? spec;

  /// Contains an optional [Status] for a [Resource].
  Status? status;

  /// Used for internal tracking purposes.
  late String kind;

  /// Used for internal tracking purposes.
  late String namespace;

  /// Used for internal tracking purposes.
  late ClusterAuth auth;

  /// The API path for V1 Core resource types.
  static const coreAPI = '/api/v1';

  /// The API path for V1 Apps resource types.
  static const appsAPI = '/apis/apps/v1';

  /// The API path for V1 Batch resource types.
  static const batchAPI = '/apis/batch/v1';

  /// [ignoreList] is a list of [ResourceKind] enums to ignore when listing
  /// resources.
  static const ignoreList = [
    ResourceKind.unknown,
    ResourceKind.container,
    ResourceKind.volume,
    ResourceKind.binding,
  ];

  /// [ignoreShow] is a list of [ResourceKind] enums to ignore when showing
  /// resources.
  static const ignoreShow = [
    ...ignoreList,
    ResourceKind.persistentVolume,
  ];

  /// [apiReadKinds] gathers a list of API readable [ResourceKind]s.
  ///
  /// Will return the list sorted by [ResourceKind.name], with [ignoreList]
  /// resources removed.
  static List<ResourceKind> get apiReadKinds {
    List<ResourceKind> values = [];
    for (var e in ResourceKind.values) {
      values.add(e);
    }
    return values
      ..sort(
        (a, b) => a.name.compareTo(b.name),
      )
      ..removeWhere(
        (e) => ignoreList.contains(e),
      );
  }

  /// [getApi] returns the correct API path for a given [resourceKind].
  ///
  /// Current supportes API paths are:
  /// - [coreAPI]
  /// - [appsAPI]
  /// - [batchAPI]
  static String? getApi({required String resourceKind}) {
    switch (ResourceKind.fromString(resourceKind)) {
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

      final resource = Resource.fromMap(item);
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

    return Resource.fromMap(data);
  }

  static Future<Resource?> create({
    ClusterAuth? auth,
    required String resourceKind,
    required Map<String, dynamic> body,
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
        ? '$api/namespaces/$namespace/$resourceKindPluralized'
        : '$api/$resourceKindPluralized';
    final uri = Uri.parse('${auth.cluster!.server!}$resourcePath');

    final response = await auth.post(uri, body: body);
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

    return Resource.fromMap(data);
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
    final api = Resource.getApi(resourceKind: kind);

    var resourceKindPluralized = kind.toLowerCase().toPluralForm();

    final resourcePath =
        '$api/namespaces/$namespace/$resourceKindPluralized/${metadata.name}';
    final uri = Uri.parse('${auth.cluster!.server!}$resourcePath');

    final response = await auth.delete(uri);
    if (response.statusCode > 299) {
      return null;
    }
  }

  /// [Resource.fromMap] constructs an instance of a [Resource] from a
  /// Kubernetes API result as [data].
  Resource.fromMap(Map<String, dynamic> data) {
    if (data.isEmpty) return;

    kind = data['kind'];
    metadata = ObjectMeta.fromMap(data['metadata']);
    namespace = metadata.namespace ?? 'default';
    if (data.containsKey('spec')) {
      spec = Spec.fromMap(data['spec'], kind: ResourceKind.fromString(kind));
    }
    if (data.containsKey('status')) {
      status = Status.fromMap(data['status']);
    }
  }

  Map<String, dynamic> toMap() => {
        'metatdata': metadata.toMap(),
        if (spec != null) 'spec': spec!.toMap(),
        if (status != null) 'status': status!.toMap(),
      };
}

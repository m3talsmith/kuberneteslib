import 'dart:convert';

import 'package:humanizer/humanizer.dart';
import 'package:kuberneteslib/kuberneteslib.dart';
import 'package:kuberneteslib/src/auth/exceptions.dart';

class Resource {
  late ObjectMeta metadata;
  Spec? spec;
  Status? status;

  late String kind;
  late String namespace;
  late ClusterAuth auth;

  static const coreAPI = '/api/v1';
  static const appsAPI = '/apis/apps/v1';
  static const batchAPI = '/apis/batch/v1';

  static const ignoreList = [
    ResourceKind.unknown,
    ResourceKind.container,
    ResourceKind.volume,
    ResourceKind.binding,
  ];

  static const ignoreShow = [
    ...ignoreList,
    ResourceKind.persistentVolume,
  ];

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

  static String? getApi({required String resourceKind, bool pluralize = true}) {
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
      item['kind'] = resourceKind;
      item['api'] = api;
      item['auth'] = auth;
      final resource = Resource.fromMap(item);
      resources.add(resource);
    }

    return resources;
  }

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

    data['kind'] = resourceKind.toSingularForm();
    data['auth'] = auth;
    return Resource.fromMap(data);
  }

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
}

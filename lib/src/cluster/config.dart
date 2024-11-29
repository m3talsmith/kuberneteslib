import 'dart:convert';

import 'package:json2yaml/json2yaml.dart';
import 'package:yaml/yaml.dart';

import 'cluster.dart';
import 'context.dart';
import 'exec.dart';
import 'user.dart';

/// A collection of Kubernetes configurations that provides utilities for managing
/// multiple config entries.
class Configs {
  /// Creates a new [Configs] instance with an optional list of [Config] objects.
  Configs({List<Config> configs = const []}) : _configs = configs;

  final List<Config> _configs;

  /// Converts a JSON array into a [Configs] instance.
  /// 
  /// The input [data] should be a List of configuration objects that match
  /// the Kubernetes config format.
  static Configs fromJson(List<dynamic> data) {
    final List<Config> configs = [];
    for (var c in data) {
      final config = Config.fromMap(c);
      if (config != null) configs.add(config);
    }
    return Configs(configs: configs);
  }

  /// Serializes the [Configs] instance into a JSON-compatible Map.
  /// 
  /// Returns a Map with a 'configs' key containing an array of serialized
  /// configuration objects.
  Map<String, dynamic> toJson() {
    final dataMaps = [];
    for (var config in _configs) {
      dataMaps.add(config.asMap());
    }
    return {'configs': dataMaps};
  }

  /// Returns the internal list of [Config] objects.
  List<Config> toList() {
    return _configs;
  }
}

/// Represents a complete Kubernetes configuration file.
/// 
/// This class models the structure of a kubeconfig file, containing information about
/// clusters, contexts, users, and other Kubernetes configuration details.
class Config {
  /// The Kubernetes API version for this config
  String? apiVersion;

  /// List of Kubernetes clusters defined in this config
  List<Cluster> clusters = [];

  /// List of contexts that define cluster-user pairs
  List<Context> contexts = [];

  /// The currently active context name
  String? currentContext;

  /// The kind of the configuration (typically "Config")
  String? kind;

  /// Additional preferences for the configuration
  Map<String, dynamic> preferences = {};

  /// List of user credentials defined in this config
  List<User> users = [];

  /// Optional display name for the configuration
  String? displayName;

  /// Creates a [Config] instance from a Map representation.
  /// 
  /// The [buff] parameter should be a Map that follows the Kubernetes
  /// config file structure. Returns null if the input is empty.
  static Config? fromMap(Map<String, dynamic> buff) {
    if (buff.isEmpty) return null;

    final config = Config();
    config.apiVersion = buff['apiVersion'] ?? '';
    for (var c in buff['clusters']) {
      Cluster cluster = Cluster(
        certificateAuthorityData: c['cluster']['certificate-authority-data'],
        server: c['cluster']['server'],
        name: c['name'],
      );
      config.clusters.add(cluster);
    }
    for (var c in buff['contexts']) {
      Context context = Context(
        cluster: c['context']['cluster'],
        user: c['context']['user'],
        name: c['name'],
      );
      config.contexts.add(context);
    }
    config.currentContext = buff['current-context'];
    config.kind = buff['kind'];
    for (var u in buff['users']) {
      final exec = (u['user'].containsKey('exec') && u['user']['exec'] != null)
          ? Exec.fromMap(u['user']['exec'])
          : null;
      User user = User(
        clientCertificateData: u['user']['client-certificate-data'],
        clientKeyData: u['user']['client-key-data'],
        exec: exec,
        name: u['name'],
      );
      config.users.add(user);
    }
    config.displayName = buff['display-name'];
    return config;
  }

  /// Creates a [Config] instance from a YAML string.
  /// 
  /// Returns null if the input [data] is empty.
  static Config? fromYaml(String data) {
    if (data.isEmpty) return null;
    final configMapping = _fromYamlMap(loadYaml(data));
    return Config.fromMap(configMapping);
  }

  /// Converts the configuration into a Map representation suitable for serialization.
  /// 
  /// If no current context is set, defaults to the first context in the list.
  Map<String, dynamic> asMap() => {
        "apiVersion": apiVersion,
        "clusters": clusters
            .map(
              (e) => e.asMap(),
            )
            .toList(),
        "contexts": contexts
            .map(
              (e) => e.asMap(),
            )
            .toList(),
        "current-context":
            (currentContext != null && currentContext!.isNotEmpty)
                ? currentContext
                : contexts.first.name,
        "kind": kind,
        "preferences": preferences,
        "users": users
            .map(
              (e) => e.asMap(),
            )
            .toList(),
        "display-name": displayName,
      };

  /// Exports the configuration as a YAML string.
  String toYaml() {
    return json2yaml(asMap());
  }
}

/// Converts a YAML node to its corresponding Dart type.
/// 
/// Handles conversion of:
/// - YamlMap to Map<String, dynamic>
/// - YamlList to List<dynamic>
/// - Other values are returned as-is
dynamic _convertNode(dynamic v) {
  if (v is YamlMap) {
    return _fromYamlMap(v);
  } else if (v is YamlList) {
    var list = <dynamic>[];
    for (var e in v) {
      list.add(_convertNode(e));
    }
    return list;
  } else {
    return v;
  }
}

/// Converts a [YamlMap] to a Dart [Map<String, dynamic>].
/// 
/// Used internally to convert YAML structures to Dart structures.
Map<String, dynamic> _fromYamlMap(YamlMap nodes) {
  var map = <String, dynamic>{};
  nodes.forEach((k, v) {
    map[k] = _convertNode(v);
  });
  return map;
}

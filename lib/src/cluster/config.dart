import 'package:json2yaml/json2yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yaml/yaml.dart';

import 'cluster.dart';
import 'context.dart';
import 'user.dart';

part 'config.g.dart';

/// A collection of Kubernetes configurations that provides utilities for managing
/// multiple config entries.
///
/// This class serves as a container for multiple Kubernetes configurations,
/// typically used when managing multiple kubeconfig files or merging configurations
/// from different sources.
///
/// Example:
/// ```dart
/// final configs = Configs(configs: [
///   Config()..currentContext = 'dev-cluster',
///   Config()..currentContext = 'prod-cluster',
/// ]);
/// ```
@JsonSerializable()
class Configs {
  /// Creates a new [Configs] instance with an optional list of [Config] objects.
  Configs({List<Config> configs = const []});

  factory Configs.fromJson(Map<String, dynamic> json) =>
      _$ConfigsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigsToJson(this);
}

/// Represents a complete Kubernetes configuration file.
/// 
/// This class models the structure of a kubeconfig file, which is the standard
/// configuration file used by Kubernetes command-line tools and clients. It contains
/// all necessary information to connect to and authenticate with Kubernetes clusters.
///
/// The configuration includes:
/// - Cluster definitions (API server endpoints and CA certificates)
/// - User credentials (certificates, tokens, etc.)
/// - Contexts (combinations of clusters and users)
/// - Preferences and other metadata
///
/// Example:
/// ```dart
/// final config = Config()
///   ..apiVersion = 'v1'
///   ..currentContext = 'my-context'
///   ..clusters = [Cluster(name: 'my-cluster', server: 'https://k8s.example.com')]
///   ..contexts = [Context(name: 'my-context', cluster: 'my-cluster')]
///   ..users = [User(name: 'admin')];
///
/// // Export to YAML
/// String yamlConfig = config.toYaml();
/// ```
///
/// The configuration can be loaded from and exported to YAML format, which is
/// compatible with standard Kubernetes tools like `kubectl`.
@JsonSerializable()
class Config {
  Config();
  /// The Kubernetes API version for this config
  @JsonKey(includeIfNull: false)
  String? apiVersion;

  /// List of Kubernetes clusters defined in this config
  List<Cluster> clusters = [];

  /// List of contexts that define cluster-user pairs
  List<Context> contexts = [];

  /// The currently active context name
  @JsonKey(includeIfNull: false)
  String? currentContext;

  /// The kind of the configuration (typically "Config")
  @JsonKey(includeIfNull: false)
  String? kind;

  /// Additional preferences for the configuration
  Map<String, dynamic> preferences = {};

  /// List of user credentials defined in this config
  List<User> users = [];

  /// Optional display name for the configuration
  @JsonKey(includeIfNull: false)
  String? displayName;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  /// Creates a [Config] instance from a YAML string.
  /// 
  /// Returns null if the input [data] is empty.
  static Config? fromYaml(String data) {
    if (data.isEmpty) return null;
    final configMapping = _fromYamlMap(loadYaml(data));
    return Config.fromJson(configMapping);
  }

  /// Exports the configuration as a YAML string.
  String toYaml() {
    return json2yaml(toJson());
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

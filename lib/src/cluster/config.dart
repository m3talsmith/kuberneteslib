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

class Configs {
  /// Creates a new [Configs] instance with an optional list of [Config] objects.
  Configs({List<Config>? configs}) : configs = configs ?? [];

  /// The list of configurations
  List<Config> configs = [];

  /// Maps each configuration in the collection to a new value using the provided
  /// transform function.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// final contexts = configs.map((config) => config.currentContext);
  /// ```
  T map<T>(T Function(Config config) transform) => configs.map(transform).toList() as T;

  /// Reduces the collection of configurations to a single value by iteratively
  /// combining each configuration with an accumulator value.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev');
  /// configs.add(Config()..currentContext = 'prod'); 
  /// final contexts = configs.reduce<String>(
  ///   '', 
  ///   (acc, config) => '$acc${config.currentContext},'
  /// );
  /// ```
  T reduce<T>(T initialValue, T Function(T accumulator, Config element) combine) => configs.fold(initialValue, combine);

  /// Inserts a configuration at the specified index in the collection.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev');
  /// configs.insert(0, Config()..currentContext = 'prod');
  /// ```
  void insert(int index, Config config) => configs.insert(index, config);

  /// Returns the first configuration in the collection that matches the predicate,
  /// or returns the provided default value if no match is found.
  ///
  /// This method allows searching through configurations with a custom predicate
  /// function while providing a fallback value if no match is found.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// final result = configs.firstOrElse(
  ///   (config) => config.currentContext == 'prod-cluster',
  ///   orElse: () => Config()..currentContext = 'default'
  /// );
  /// print(result.currentContext); // prints: default
  /// ```
  Config firstOrElse(bool Function(Config config) test, {required Config Function() orElse}) {
    for (final config in configs) {
      if (test(config)) return config;
    }
    return orElse();
  }

  /// Returns the first configuration in the collection.
  ///
  /// This getter provides access to the first configuration in the list.
  /// Returns null if the collection is empty.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// print(configs.first?.currentContext); // prints: dev-cluster
  /// ```
  Config? get first => configs.isEmpty ? null : configs.first;

  /// Returns the last configuration in the collection.
  ///
  /// This getter provides access to the last configuration in the list.
  /// Returns null if the collection is empty.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// print(configs.last?.currentContext); // prints: dev-cluster
  /// ```
  Config? get last => configs.isEmpty ? null : configs.last;

  /// Adds a new configuration to the collection.
  ///
  /// Takes a [Config] object and appends it to the internal list of configurations.
  /// This is useful when building up a collection of Kubernetes configurations
  /// incrementally.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// configs.add(Config()..currentContext = 'prod-cluster');
  /// ```
  void add(Config config) => configs.add(config);
  
  /// Adds all configurations from another [Configs] collection.
  ///
  /// Takes a [Configs] object and adds all of its configurations to this collection.
  /// This is useful when merging multiple configuration collections.
  ///
  /// Example:
  /// ```dart
  /// final configs1 = Configs()..add(Config()..currentContext = 'dev-cluster');
  /// final configs2 = Configs()..add(Config()..currentContext = 'prod-cluster');
  /// configs1.addAll(configs2);
  /// print(configs1.length); // 2
  /// ```
  void addAll(Configs other) => configs.addAll(other.configs);

  /// Removes a configuration from the collection.
  ///
  /// Takes a [Config] object and removes it from the internal list of configurations.
  /// Returns true if the configuration was found and removed, false otherwise.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// final config = Config()..currentContext = 'dev-cluster';
  /// configs.add(config);
  /// configs.remove(config); // returns true
  /// ```
  bool remove(Config config) => configs.remove(config);

  /// Returns the number of configurations in this collection.
  ///
  /// This getter provides a convenient way to check how many configurations are
  /// currently stored.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// print(configs.length); // 0
  /// configs.add(Config());
  /// print(configs.length); // 1
  /// ```
  int get length => configs.length;

  /// Returns the index of a configuration in this collection.
  ///
  /// Takes a [Config] object and returns its index in the internal list of configurations.
  /// Returns -1 if the configuration is not found.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// final config = Config()..currentContext = 'dev-cluster';
  /// configs.add(config);
  /// print(configs.indexOf(config)); // 0
  /// ```
  int indexOf(Config config) => configs.indexOf(config);

  /// Returns the index of the first configuration that satisfies the given predicate.
  ///
  /// Takes a predicate function that tests each configuration and returns true when
  /// a match is found. Returns -1 if no configuration matches the predicate.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// configs.add(Config()..currentContext = 'prod-cluster'); 
  /// print(configs.indexWhere(
  ///   (config) => config.currentContext == 'dev-cluster'
  /// )); // 0
  /// ```
  int indexWhere(bool Function(Config) test) => configs.indexWhere(test);

  /// Returns the first configuration that satisfies the given predicate.
  ///
  /// Takes a predicate function that tests each configuration and returns the first
  /// configuration that matches. Throws a [StateError] if no configuration matches
  /// the predicate.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// configs.add(Config()..currentContext = 'prod-cluster');
  /// final devConfig = configs.firstWhere(
  ///   (config) => config.currentContext == 'dev-cluster'
  /// );
  /// ```
  Config firstWhere(bool Function(Config) test) => configs.firstWhere(test);

  /// Returns true if any configuration in this collection satisfies the given predicate.
  ///
  /// Takes a predicate function that tests each configuration and returns true if at
  /// least one configuration matches. Returns false if no configurations match.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// print(configs.any(
  ///   (config) => config.currentContext == 'dev-cluster'
  /// )); // true
  /// ```
  bool any(bool Function(Config) test) => configs.any(test);

  /// Returns true if every configuration in this collection satisfies the given predicate.
  ///
  /// Takes a predicate function that tests each configuration and returns true only if
  /// all configurations match. Returns true if the collection is empty.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// print(configs.every(
  ///   (config) => config.currentContext.isNotEmpty
  /// )); // true
  /// ```
  bool every(bool Function(Config) test) => configs.every(test);

  /// Returns true if this collection contains no configurations.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// print(configs.isEmpty); // true
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// print(configs.isEmpty); // false
  /// ```
  bool get isEmpty => configs.isEmpty;

  /// Returns true if this collection contains at least one configuration.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs();
  /// print(configs.isNotEmpty); // false
  /// configs.add(Config()..currentContext = 'dev-cluster');
  /// print(configs.isNotEmpty); // true
  /// ```
  bool get isNotEmpty => configs.isNotEmpty;

  /// Returns a new [Configs] instance with the configurations in reverse order.
  ///
  /// Example:
  /// ```dart
  /// final configs = Configs()
  ///   ..add(Config()..currentContext = 'dev')
  ///   ..add(Config()..currentContext = 'prod');
  /// final reversed = configs.reversed;
  /// print(reversed.first.currentContext); // prints: 'prod'
  /// ```
  Iterable<Config> get reversed => configs.reversed;

  /// Returns a list of all configurations in this collection.
  ///
  /// This method provides a way to access all configurations stored in the [Configs]
  /// instance. The returned list is a copy of the internal list, so modifications to
  /// the returned list will not affect the original [Configs] instance.
  List<Config> toList() => configs;

  factory Configs.fromJson(Map<String, dynamic> json) {
    final configs = Configs();
    for (var e in json['configs']) {
      configs.add(Config.fromJson(e as Map<String, dynamic>));
    }
    return configs;
  }

  Map<String, dynamic> toJson() {
    final configJson = <dynamic>[];
    for (var config in configs) {
      configJson.add(config.toJson());
    }
    final json = {'configs': configJson};
    return json;
  }
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

  factory Config.fromJson(Map<String, dynamic> data) => _$ConfigFromJson(data);

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

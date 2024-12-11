import 'package:json_annotation/json_annotation.dart';

part 'context.g.dart';

/// Represents a Kubernetes context configuration that links clusters with users.
///
/// A context in Kubernetes defines the connection parameters for interacting with a cluster.
/// It combines:
/// - A cluster (specifying the API server)
/// - A user (specifying authentication details)
/// - A namespace (optional)
///
/// This class is typically used in conjunction with [Config] to establish
/// authenticated connections to Kubernetes clusters.
///
/// Example:
/// ```dart
/// final context = Context(
///   name: 'prod-context',
///   cluster: 'production-cluster',
///   user: 'admin-user'
/// );
/// ```
///
/// When used with [ClusterAuth], the context determines which cluster and user
/// credentials to use for API requests:
/// ```dart
/// final config = Config.fromYaml(yamlString);
/// final context = config.contexts.firstWhere(
///   (e) => e.name == config.currentContext
/// );
/// ```
@JsonSerializable()
class Context {
  /// Creates a new [Context] instance.
  ///
  /// Parameters:
  /// - [cluster]: The name of the cluster this context refers to
  /// - [user]: The name of the user for authentication
  /// - [name]: A unique identifier for this context
  Context({this.cluster, this.user, this.name});

  /// The name of the cluster this context refers to.
  /// 
  /// This should match the name of a cluster defined in the kubeconfig.
  @JsonKey(includeIfNull: false)
  String? cluster;

  /// The name of the user for authentication.
  /// 
  /// This should match the name of a user defined in the kubeconfig.
  @JsonKey(includeIfNull: false)
  String? user;

  /// A unique identifier for this context.
  /// 
  /// This name is used to reference the context in the kubeconfig,
  /// particularly when setting the current-context.
  @JsonKey(includeIfNull: false, includeToJson: false)
  String? name;

  factory Context.fromJson(Map<String, dynamic> json) {
    final contextData = json['context'];
    contextData['name'] = json['name'];
    Map<String, dynamic> data = {};
    for (var e in contextData.entries) {
      data[e.key] = e.value;
    }
    final context = _$ContextFromJson(data);
    return context;
  }

  Map<String, dynamic> toJson() {
    final contextJson = _$ContextToJson(this);
    contextJson.remove('name');
    final json = {'context': contextJson, 'name': name};
    return json;
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'exec.g.dart';

/// Represents an executable command configuration for Kubernetes authentication.
///
/// This class is used to configure external authentication commands, typically for
/// cloud provider-specific authentication tools like `doctl` (DigitalOcean),
/// `aws` (AWS), or `gcloud` (Google Cloud).
///
/// The executable command is expected to output authentication credentials that
/// can be used to authenticate with a Kubernetes cluster.
///
/// Example:
/// ```dart
/// final exec = Exec(
///   command: 'doctl',
///   arguments: ['kubernetes', 'cluster', 'kubeconfig', 'show', 'my-cluster'],
///   apiVersion: 'client.authentication.k8s.io/v1beta1',
///   interactiveMode: 'Never',
/// );
/// ```
@JsonSerializable()
class Exec {
  /// Creates a new [Exec] instance with specified command configuration.
  ///
  /// Parameters:
  /// - [command]: The executable command (defaults to 'doctl')
  /// - [arguments]: List of command-line arguments
  /// - [apiVersion]: Kubernetes API version for auth (defaults to v1beta1)
  /// - [env]: Environment variables for the command
  /// - [interactiveMode]: How to handle interactive prompts
  /// - [provideClusterInfo]: Whether to include cluster info in context
  Exec({
    this.command = 'doctl',
    this.arguments,
    this.apiVersion = 'client.authentication.k8s.io/v1beta1',
    this.env,
    this.interactiveMode = 'IfAvailable',
    this.provideClusterInfo = false,
  });

  /// The command to execute (e.g., 'doctl')
  @JsonKey(includeIfNull: false)
  String? command;
  
  /// List of command-line arguments to pass to the command
  @JsonKey(includeIfNull: false)
  List<String>? arguments;
  
  /// The Kubernetes API version to use for authentication
  /// Defaults to 'client.authentication.k8s.io/v1beta1'
  @JsonKey(includeIfNull: false)
  String? apiVersion;
  
  /// Environment variables to set during command execution
  /// Format should follow shell environment variable syntax
  @JsonKey(includeIfNull: false)
  String? env;
  
  /// Controls how interactive mode behaves during command execution
  /// Possible values: 'Never', 'IfAvailable', 'Always'
  @JsonKey(includeIfNull: false)
  String? interactiveMode;
  
  /// When true, includes additional cluster information in the execution context
  @JsonKey(includeIfNull: false)
  bool? provideClusterInfo;

  factory Exec.fromJson(Map<String, dynamic> json) => _$ExecFromJson(json);

  Map<String, dynamic> toJson() => _$ExecToJson(this);
}

/// Represents the complete result of an authentication command execution.
///
/// This class contains both the command specification and the resulting
/// authentication status, including any tokens or credentials obtained from
/// the command execution.
///
/// Example:
/// ```dart
/// final result = ExecResult(
///   kind: 'ExecCredential',
///   apiVersion: 'client.authentication.k8s.io/v1beta1',
///   spec: ExecSpec(interactive: false),
///   status: ExecStatus(token: 'auth-token'),
/// );
/// ```
@JsonSerializable()
class ExecResult {
  ExecResult({
    required this.kind,
    required this.apiVersion,
    required this.spec,
    required this.status,
  });

  /// The type of the result, typically indicates the Kubernetes resource type
  final String kind;
  
  /// The API version used for this result
  final String apiVersion;
  
  /// The specification details of the execution
  final ExecSpec spec;
  
  /// The status of the execution, including authentication tokens and expiration
  final ExecStatus status;

  factory ExecResult.fromJson(Map<String, dynamic> json) => _$ExecResultFromJson(json);

  Map<String, dynamic> toJson() => _$ExecResultToJson(this);
}

/// Specifies the execution parameters used during authentication.
///
/// This class defines how the authentication command should be executed,
/// particularly regarding interactive behavior.
@JsonSerializable()
class ExecSpec {
  ExecSpec({
    this.interactive = false,
  });

  /// Whether the execution was performed in interactive mode
  @JsonKey(includeIfNull: false)
  bool? interactive;

  factory ExecSpec.fromJson(Map<String, dynamic> json) => _$ExecSpecFromJson(json);

  Map<String, dynamic> toJson() => _$ExecSpecToJson(this);
}

/// Contains the authentication results from a successful command execution.
///
/// This class holds the authentication token and its expiration details
/// obtained from executing the authentication command.
///
/// The token can be used for subsequent API requests to the Kubernetes cluster.
@JsonSerializable()
class ExecStatus {
  ExecStatus({
    this.expirationTimestamp,
    this.token,
  });

  /// The timestamp when the current authentication token will expire
  /// May be null if the token doesn't have an expiration
  @JsonKey(includeIfNull: false)
  DateTime? expirationTimestamp;
  
  /// The authentication token obtained from the command execution
  /// This token is used for subsequent Kubernetes API authentication
  @JsonKey(includeIfNull: false)
  String? token;

  factory ExecStatus.fromJson(Map<String, dynamic> json) => _$ExecStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ExecStatusToJson(this);
}

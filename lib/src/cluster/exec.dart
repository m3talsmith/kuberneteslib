/// Represents an executable command configuration, primarily used for Kubernetes authentication.
/// This class is typically used to configure and execute `doctl` commands for authenticating
/// with a Kubernetes cluster.
class Exec {
  Exec({
    this.command = 'doctl',
    this.arguments,
    this.apiVersion = 'client.authentication.k8s.io/v1beta1',
    this.env,
    this.interactiveMode = 'IfAvailable',
    this.provideClusterInfo = false,
  });

  /// The command to execute (e.g., 'doctl')
  String? command;
  
  /// List of command-line arguments to pass to the command
  List<String>? arguments;
  
  /// The Kubernetes API version to use for authentication
  /// Defaults to 'client.authentication.k8s.io/v1beta1'
  String? apiVersion;
  
  /// Environment variables to set during command execution
  /// Format should follow shell environment variable syntax
  String? env;
  
  /// Controls how interactive mode behaves during command execution
  /// Possible values: 'Never', 'IfAvailable', 'Always'
  String? interactiveMode;
  
  /// When true, includes additional cluster information in the execution context
  bool? provideClusterInfo;

  /// Creates an [Exec] instance from a Map representation
  /// 
  /// [data] should contain keys matching the class properties
  Exec.fromMap(Map<String, dynamic> data) {
    command = data['command'] ?? 'doctl';

    arguments = [];
    for (var arg in data['args']) {
      arguments!.add(arg);
    }

    apiVersion = data['apiVersion'] ?? 'client.authentication.k8s.io/v1beta1';
    env = data['env'];
    interactiveMode = data['interactiveMode'] ?? 'IfAvailable';
    provideClusterInfo = data['provideClusterInfo'] ?? false;
  }

  /// Converts this [Exec] instance to a Map representation suitable for serialization
  Map<String, dynamic> asMap() => {
        "apiVersion": apiVersion,
        "args": arguments,
        "command": command,
        "env": env,
        "interactiveMode": interactiveMode,
        "provideClusterInfo": provideClusterInfo,
      };
}

/// Represents the complete result of an executed authentication command.
/// Contains both the execution specification and resulting status information.
class ExecResult {
  ExecResult({
    required this.kind,
    required this.apiVersion,
    required this.spec,
    required this.status,
  });

  /// The type of the result, typically indicates the Kubernetes resource type
  late final String kind;
  
  /// The API version used for this result
  late final String apiVersion;
  
  /// The specification details of the execution
  late final ExecSpec spec;
  
  /// The status of the execution, including authentication tokens and expiration
  late final ExecStatus status;

  /// Parses the [Exec] run result into an [ExecResult].
  ExecResult.fromMap(Map<String, dynamic> data) {
    kind = data['kind'];
    apiVersion = data['apiVersion'];
    spec = ExecSpec.fromMap(data['spec']);
    status = ExecStatus.fromMap(data['status']);
  }
}

/// Specifies the execution parameters and configuration used during
/// the authentication command execution.
class ExecSpec {
  ExecSpec({
    this.interactive = false,
  });

  /// Whether the execution was performed in interactive mode
  late final bool interactive;

  /// Exports [ExecSpec] into a serializable format.
  ExecSpec.fromMap(Map<String, dynamic> data) {
    interactive = data['interactive'];
  }
}

/// Contains the authentication result and token information returned
/// from a successful command execution.
class ExecStatus {
  ExecStatus({
    this.expirationTimestamp,
    this.token,
  });

  /// The timestamp when the current authentication token will expire
  /// May be null if the token doesn't have an expiration
  late final DateTime? expirationTimestamp;
  
  /// The authentication token obtained from the command execution
  /// This token is used for subsequent Kubernetes API authentication
  late final String? token;

  /// Exports [ExecStatus] into a serializable format.
  ExecStatus.fromMap(Map<String, dynamic> data) {
    expirationTimestamp = DateTime.tryParse(data['expirationTimestamp']);
    token = data['token'];
  }
}

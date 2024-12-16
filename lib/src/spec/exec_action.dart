import 'package:json_annotation/json_annotation.dart';

part 'exec_action.g.dart';

/// Represents an executable action in Kubernetes.
///
/// ExecAction defines a command to be executed inside a container.
/// Key features include:
/// - Command execution
/// - Multi-argument support
/// - Shell command splitting
/// - Container context execution
///
/// Common use cases:
/// - Health checks
/// - Lifecycle hooks
/// - Initialization scripts
/// - Diagnostic commands
///
/// Example:
/// ```dart
/// final execAction = ExecAction()
///   ..command = [
///     '/bin/sh',
///     '-c',
///     'pg_isready -U postgres -h localhost'
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-liveness-command)
/// for more details about exec actions in probes and lifecycle hooks.
@JsonSerializable()
class ExecAction {
  ExecAction();

  /// The command to execute inside the container.
  ///
  /// Required: The command and its arguments as a list of strings.
  /// Each element is a separate argument, similar to a command-line shell:
  /// - Element 0: The command to run
  /// - Elements 1+: Arguments to the command
  ///
  /// Example:
  /// ```dart
  /// command = ['ls', '-l', '/var/log']  // Executes "ls -l /var/log"
  /// ```
  @JsonKey(includeIfNull: false)
  List<String>? command;

  factory ExecAction.fromJson(Map<String, dynamic> json) =>
      _$ExecActionFromJson(json);

  Map<String, dynamic> toJson() => _$ExecActionToJson(this);
}

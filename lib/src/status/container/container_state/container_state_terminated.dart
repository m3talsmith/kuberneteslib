import 'package:json_annotation/json_annotation.dart';

part 'container_state_terminated.g.dart';

/// ContainerStateTerminated represents a terminated state of a container.
///
/// This class holds information about how and why a container terminated, including
/// exit codes, timestamps, and termination reasons.
///
/// Example creating a terminated state:
/// ```dart
/// final terminatedState = ContainerStateTerminated(
///   containerID: 'docker://abc123',
///   exitCode: '0',
///   finishedAt: DateTime.now(),
///   reason: 'Completed',
/// );
/// ```
///
/// Example parsing from JSON:
/// ```dart
/// final json = {
///   'containerID': 'docker://abc123',
///   'exitCode': '137',
///   'finishedAt': '2024-03-15T10:30:00Z',
///   'reason': 'Error',
///   'signal': 9,
///   'message': 'Container was terminated by SIGKILL'
/// };
///
/// final terminatedState = ContainerStateTerminated.fromJson(json);
/// ```
@JsonSerializable()
class ContainerStateTerminated {
  /// Creates a new [ContainerStateTerminated] instance.
  ContainerStateTerminated({
    this.containerID,
    this.exitCode,
    this.finishedAt,
    this.message,
    this.reason,
    this.signal,
    this.startedAt,
  });

  /// The container's ID in the runtime.
  ///
  /// This is the unique identifier assigned to the container by the container runtime.
  @JsonKey(includeIfNull: false)
  String? containerID;

  /// Exit status from the last termination of the container.
  @JsonKey(includeIfNull: false)
  String? exitCode;

  /// Time at which the container last terminated.
  @JsonKey(includeIfNull: false)
  DateTime? finishedAt;

  /// Message regarding the last termination of the container.
  @JsonKey(includeIfNull: false)
  String? message;

  /// (brief) reason the container last terminated.
  ///
  /// This is typically a short, machine-readable string indicating the reason
  /// for termination.
  @JsonKey(includeIfNull: false)
  String? reason;

  /// Signal which caused the container to last terminate.
  ///
  /// This represents the signal number that caused the container to terminate,
  /// if the container was terminated by a signal.
  @JsonKey(includeIfNull: false)
  int? signal;

  /// Time at which previous execution of the container started.
  @JsonKey(includeIfNull: false)
  DateTime? startedAt;

  /// Creates a [ContainerStateTerminated] instance from a JSON map.
  factory ContainerStateTerminated.fromJson(Map<String, dynamic> json) =>
      _$ContainerStateTerminatedFromJson(json);

  /// Converts this [ContainerStateTerminated] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ContainerStateTerminatedToJson(this);
}

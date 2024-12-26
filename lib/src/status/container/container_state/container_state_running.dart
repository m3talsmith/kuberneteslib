import 'package:json_annotation/json_annotation.dart';

part 'container_state_running.g.dart';

/// ContainerStateRunning represents a running state of a container.
///
/// This class holds information about a container that is currently executing.
///
/// Example:
/// ```dart
/// final runningState = ContainerStateRunning(
///   startedAt: DateTime.parse('2024-03-14T15:30:00Z'),
/// );
///
/// // Convert to JSON
/// final json = runningState.toJson();
/// // Result: {'startedAt': '2024-03-14T15:30:00.000Z'}
///
/// // Create from JSON
/// final fromJson = ContainerStateRunning.fromJson({
///   'startedAt': '2024-03-14T15:30:00Z',
/// });
/// ```
@JsonSerializable()
class ContainerStateRunning {
  /// Creates a new [ContainerStateRunning] instance.
  ///
  /// [startedAt] is the time at which the container was started.
  ///
  /// Example:
  /// ```dart
  /// final state = ContainerStateRunning(
  ///   startedAt: DateTime.now(),
  /// );
  /// ```
  ContainerStateRunning({
    this.startedAt,
  });

  /// Time at which the container was last started.
  ///
  /// This timestamp represents when the container runtime started the container.
  /// It is represented in RFC3339 format.
  ///
  /// Example:
  /// ```dart
  /// final startTime = state.startedAt; // DateTime object
  /// final isoString = startTime?.toIso8601String(); // Convert to RFC3339 string
  /// ```
  @JsonKey(includeIfNull: false)
  DateTime? startedAt;

  /// Creates a [ContainerStateRunning] instance from a JSON map.
  factory ContainerStateRunning.fromJson(Map<String, dynamic> json) =>
      _$ContainerStateRunningFromJson(json);

  /// Converts this [ContainerStateRunning] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ContainerStateRunningToJson(this);
}

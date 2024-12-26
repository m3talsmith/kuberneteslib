import 'package:json_annotation/json_annotation.dart';

import 'container_state/container_state_running.dart';
import 'container_state/container_state_terminated.dart';
import 'container_state/container_state_waiting.dart';

part 'container_state.g.dart';

/// ContainerState holds a possible state of container.
/// Exactly one of its members must be specified.
///
/// Example creating a running container state:
/// ```dart
/// final runningState = ContainerState(
///   running: ContainerStateRunning(
///     startedAt: DateTime.now(),
///   ),
/// );
/// ```
///
/// Example creating a terminated container state:
/// ```dart
/// final terminatedState = ContainerState(
///   terminated: ContainerStateTerminated(
///     exitCode: 0,
///     finishedAt: DateTime.now(),
///     startedAt: DateTime.now().subtract(Duration(minutes: 5)),
///     reason: 'Completed',
///   ),
/// );
/// ```
@JsonSerializable()
class ContainerState {
  ContainerState({
    this.running,
    this.terminated,
    this.waiting,
  });

  /// Details about a running container.
  /// Only one of [running], [terminated], or [waiting] may be specified.
  ///
  /// Example:
  /// ```dart
  /// containerState.running = ContainerStateRunning(
  ///   startedAt: DateTime.now(),
  /// );
  /// ```
  @JsonKey(
    includeIfNull: false,
    fromJson: _runningFromJson,
    toJson: _runningToJson,
  )
  ContainerStateRunning? running;

  /// Details about a terminated container.
  /// Only one of [running], [terminated], or [waiting] may be specified.
  ///
  /// Example:
  /// ```dart
  /// containerState.terminated = ContainerStateTerminated(
  ///   exitCode: 1,
  ///   reason: 'Error',
  ///   message: 'Process crashed',
  ///   startedAt: DateTime.now().subtract(Duration(minutes: 1)),
  ///   finishedAt: DateTime.now(),
  /// );
  /// ```
  @JsonKey(
    includeIfNull: false,
    fromJson: _terminatedFromJson,
    toJson: _terminatedToJson,
  )
  ContainerStateTerminated? terminated;

  /// Details about a waiting container.
  /// Only one of [running], [terminated], or [waiting] may be specified.
  ///
  /// Example:
  /// ```dart
  /// containerState.waiting = ContainerStateWaiting(
  ///   reason: 'ContainerCreating',
  ///   message: 'Pulling image...',
  /// );
  /// ```
  @JsonKey(
    includeIfNull: false,
    fromJson: _waitingFromJson,
    toJson: _waitingToJson,
  )
  ContainerStateWaiting? waiting;

  /// Creates a [ContainerState] from a JSON map.
  ///
  /// Example:
  /// ```dart
  /// final json = {
  ///   'running': {
  ///     'startedAt': '2024-03-14T12:00:00Z',
  ///   }
  /// };
  /// final state = ContainerState.fromJson(json);
  /// ```
  factory ContainerState.fromJson(Map<String, dynamic> json) =>
      _$ContainerStateFromJson(json);

  /// Converts this [ContainerState] to a JSON map.
  ///
  /// Example:
  /// ```dart
  /// final state = ContainerState(
  ///   waiting: ContainerStateWaiting(reason: 'ImagePullBackOff'),
  /// );
  /// final json = state.toJson();
  /// ```
  Map<String, dynamic> toJson() => _$ContainerStateToJson(this);
}

ContainerStateRunning? _runningFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ContainerStateRunning.fromJson(json);

Map<String, dynamic>? _runningToJson(ContainerStateRunning? running) =>
    running?.toJson();

ContainerStateTerminated? _terminatedFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ContainerStateTerminated.fromJson(json);

Map<String, dynamic>? _terminatedToJson(ContainerStateTerminated? terminated) =>
    terminated?.toJson();

ContainerStateWaiting? _waitingFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ContainerStateWaiting.fromJson(json);

Map<String, dynamic>? _waitingToJson(ContainerStateWaiting? waiting) =>
    waiting?.toJson();

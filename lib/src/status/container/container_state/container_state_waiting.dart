import 'package:json_annotation/json_annotation.dart';

part 'container_state_waiting.g.dart';

/// ContainerStateWaiting represents a waiting state of a container.
///
/// When a container is in a waiting state, it means the container is not yet
/// running or has stopped running and is waiting to start/restart.
///
/// Example:
/// ```dart
/// final waitingState = ContainerStateWaiting(
///   message: 'Back-off pulling image "nginx:latest"',
///   reason: 'ImagePullBackOff',
/// );
/// ```
@JsonSerializable()
class ContainerStateWaiting {
  /// Creates a new [ContainerStateWaiting] instance.
  ContainerStateWaiting({
    this.message,
    this.reason,
  });

  /// Message regarding why the container is not yet running.
  ///
  /// Provides detailed information about why the container is in waiting state.
  ///
  /// Example messages:
  /// - `Back-off pulling image "nginx:latest"`
  /// - `Container image "mysql:8.0" not found`
  /// - `CreateContainerConfigError`
  @JsonKey(includeIfNull: false)
  String? message;

  /// (brief) reason the container is not yet running.
  ///
  /// Possible values include:
  /// - `ContainerCreating`: The container is being created
  /// - `CrashLoopBackOff`: The container has crashed and is being restarted
  /// - `ErrImagePull`: There was an error pulling the container image
  /// - `ImagePullBackOff`: The image pull operation is being retried
  /// - `CreateContainerError`: Error while creating the container
  /// - `InvalidImageName`: The specified image name is invalid
  /// - `PodInitializing`: The pod is still initializing
  @JsonKey(includeIfNull: false)
  String? reason;

  /// Creates a [ContainerStateWaiting] from a JSON map.
  factory ContainerStateWaiting.fromJson(Map<String, dynamic> json) =>
      _$ContainerStateWaitingFromJson(json);

  /// Converts this [ContainerStateWaiting] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ContainerStateWaitingToJson(this);
}

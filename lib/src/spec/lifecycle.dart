import 'package:json_annotation/json_annotation.dart';

import 'lifecycle_handler.dart';

part 'lifecycle.g.dart';

/// Represents the lifecycle configuration for a container in Kubernetes.
///
/// Lifecycle enables defining handlers that are executed at specific points
/// in a container's lifecycle. Key features include:
/// - Post-start actions
/// - Pre-stop actions
/// - Asynchronous startup handling
/// - Graceful shutdown support
///
/// Common use cases:
/// - Application initialization
/// - Resource cleanup
/// - Graceful service termination
/// - State synchronization
///
/// Example:
/// ```dart
/// final lifecycle = Lifecycle()
///   ..postStart = LifecycleHandler()
///     ..exec = ExecAction()
///       ..command = ['/bin/sh', '-c', 'initialize-service.sh']
///   ..preStop = LifecycleHandler()
///     ..httpGet = HTTPGetAction()
///       ..path = '/shutdown'
///       ..port = 8080;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/)
/// for more details about container lifecycle hooks.
@JsonSerializable()
class Lifecycle {
  Lifecycle();

  /// Handler to be executed after the container starts.
  ///
  /// This handler runs asynchronously with respect to the container's main process
  /// and is executed after the container is created. The container's status will
  /// be marked as unhealthy and be restarted if the handler fails.
  @JsonKey(
      includeIfNull: false,
      fromJson: _postStartFromJson,
      toJson: _postStartToJson)
  LifecycleHandler? postStart;

  /// Handler to be executed before the container stops.
  ///
  /// This handler runs synchronously before the container is terminated,
  /// blocking the container's termination until the handler completes or until
  /// the termination grace period is reached.
  @JsonKey(
      includeIfNull: false, fromJson: _preStopFromJson, toJson: _preStopToJson)
  LifecycleHandler? preStop;

  factory Lifecycle.fromJson(Map<String, dynamic> json) =>
      _$LifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$LifecycleToJson(this);
}

LifecycleHandler? _postStartFromJson(Map<String, dynamic>? json) =>
    json == null ? null : LifecycleHandler.fromJson(json);

Map<String, dynamic>? _postStartToJson(LifecycleHandler? instance) =>
    instance?.toJson();

LifecycleHandler? _preStopFromJson(Map<String, dynamic>? json) =>
    json == null ? null : LifecycleHandler.fromJson(json);

Map<String, dynamic>? _preStopToJson(LifecycleHandler? instance) =>
    instance?.toJson();

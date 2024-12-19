import 'package:json_annotation/json_annotation.dart';

import 'env_from_source.dart';
import 'env_var.dart';
import 'lifecycle.dart';
import 'probe.dart';

part 'ephemeral_container.g.dart';

List<EnvVar>? _envFromJson(List<dynamic>? json) =>
    json?.map((e) => EnvVar.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _envToJson(List<EnvVar>? instance) =>
    instance?.map((e) => e.toJson()).toList();

List<EnvFromSource>? _envFromFromJson(List<dynamic>? json) => json
    ?.map((e) => EnvFromSource.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _envFromToJson(List<EnvFromSource>? instance) =>
    instance?.map((e) => e.toJson()).toList();

Lifecycle? _lifecycleFromJson(Map<String, dynamic>? json) =>
    json == null ? null : Lifecycle.fromJson(json);

Map<String, dynamic>? _lifecycleToJson(Lifecycle? instance) =>
    instance?.toJson();

Probe? _livenessProbeFromJson(Map<String, dynamic>? json) =>
    json == null ? null : Probe.fromJson(json);

Map<String, dynamic>? _livenessProbeToJson(Probe? instance) =>
    instance?.toJson();

/// Represents an ephemeral container in Kubernetes.
///
/// EphemeralContainer enables temporary containers to be added to running pods
/// for debugging and troubleshooting. Key features include:
/// - Temporary lifecycle
/// - Debugging tools
/// - Resource isolation
/// - Environment configuration
///
/// Common use cases:
/// - Interactive debugging
/// - Log collection
/// - Network diagnostics
/// - Process inspection
///
/// Example:
/// ```dart
/// final debugContainer = EphemeralContainer()
///   ..name = 'debug'
///   ..image = 'busybox:latest'
///   ..command = ['sh']
///   ..env = [
///     EnvVar()
///       ..name = 'TARGET_POD'
///       ..value = 'web-server'
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/ephemeral-containers/)
/// for more details about ephemeral containers.
@JsonSerializable()
class EphemeralContainer {
  /// Creates a new ephemeral container with default empty values.
  EphemeralContainer({
    this.args,
    this.command,
    this.env,
    this.envFrom,
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    this.name,
  });

  /// Command-line arguments for the container.
  ///
  /// These arguments are passed to the container's entrypoint command.
  List<String>? args;

  /// Entrypoint array for the container.
  ///
  /// The command to run when the container starts.
  List<String>? command;

  /// List of environment variables to set in the container.
  ///
  /// Environment variables can be set directly or referenced from ConfigMaps/Secrets.
  @JsonKey(includeIfNull: false, fromJson: _envFromJson, toJson: _envToJson)
  List<EnvVar>? env;

  /// List of sources to populate environment variables in the container.
  ///
  /// Allows bulk loading of environment variables from ConfigMaps or Secrets.
  @JsonKey(
      includeIfNull: false, fromJson: _envFromFromJson, toJson: _envFromToJson)
  List<EnvFromSource>? envFrom;

  /// Docker image name to use for this container.
  ///
  /// Required: Specifies the container image to run.
  String? image;

  /// Image pull policy for the container.
  ///
  /// Can be one of: 'Always', 'Never', 'IfNotPresent'
  String? imagePullPolicy;

  /// Actions that the management system should take in response to container lifecycle events.
  @JsonKey(
      includeIfNull: false,
      fromJson: _lifecycleFromJson,
      toJson: _lifecycleToJson)
  Lifecycle? lifecycle;

  /// Periodic probe of container liveness.
  ///
  /// Container will be restarted if the probe fails.
  @JsonKey(
      includeIfNull: false,
      fromJson: _livenessProbeFromJson,
      toJson: _livenessProbeToJson)
  Probe? livenessProbe;

  /// Name of the ephemeral container.
  ///
  /// Required: Must be unique among all containers in the pod.
  String? name;

  factory EphemeralContainer.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../helpers/container_ports_converter.dart';
import 'container_port.dart';
import 'container_resize_policy.dart';
import 'env_from_source.dart';
import 'env_var.dart';
import 'lifecycle.dart';
import 'probe.dart';
import 'resource_requirements.dart';
import 'security_context.dart';
import 'volume_device.dart';
import 'volume_mount.dart';

part 'container.g.dart';

List<EnvFromSource>? _envFromFromJson(List<dynamic>? json) => json
    ?.map((e) => EnvFromSource.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _envFromToJson(List<EnvFromSource>? instance) =>
    instance?.map((e) => e.toJson()).toList();

Lifecycle? _lifecycleFromJson(Map<String, dynamic>? json) =>
    json == null ? null : Lifecycle.fromJson(json);

Map<String, dynamic>? _lifecycleToJson(Lifecycle? instance) =>
    instance?.toJson();

Probe? _probeFromJson(Map<String, dynamic>? json) =>
    json == null ? null : Probe.fromJson(json);

Map<String, dynamic>? _probeToJson(Probe? instance) => instance?.toJson();

List<ContainerResizePolicy>? _resizePolicyFromJson(List<dynamic>? json) => json
    ?.map((e) => ContainerResizePolicy.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _resizePolicyToJson(
        List<ContainerResizePolicy>? instance) =>
    instance?.map((e) => e.toJson()).toList();

ResourceRequirements? _resourceRequirementsFromJson(
        Map<String, dynamic>? json) =>
    json == null ? null : ResourceRequirements.fromJson(json);

Map<String, dynamic>? _resourceRequirementsToJson(
        ResourceRequirements? instance) =>
    instance?.toJson();

SecurityContext? _securityContextFromJson(Map<String, dynamic>? json) =>
    json == null ? null : SecurityContext.fromJson(json);

Map<String, dynamic>? _securityContextToJson(SecurityContext? instance) =>
    instance?.toJson();

List<VolumeDevice>? _volumeDevicesFromJson(List<dynamic>? json) =>
    json?.map((e) => VolumeDevice.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _volumeDevicesToJson(
        List<VolumeDevice>? instance) =>
    instance?.map((e) => e.toJson()).toList();

List<VolumeMount>? _volumeMountsFromJson(List<dynamic>? json) =>
    json?.map((e) => VolumeMount.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _volumeMountsToJson(List<VolumeMount>? instance) =>
    instance?.map((e) => e.toJson()).toList();

/// Represents a container specification in Kubernetes.
///
/// Container defines the runtime properties of a container within a pod.
/// Key features include:
/// - Image and runtime configuration
/// - Resource management
/// - Environment variables
/// - Volume mounts
/// - Health monitoring
/// - Security settings
///
/// Common use cases:
/// - Application containers
/// - Sidecar containers
/// - Init containers
/// - Debug containers
///
/// Example:
/// ```dart
/// final container = Container()
///   ..name = 'web-server'
///   ..image = 'nginx:1.14.2'
///   ..ports = [
///     ContainerPort()
///       ..containerPort = 80
///       ..name = 'http'
///   ]
///   ..resources = ResourceRequirements()
///     ..requests = {'memory': '64Mi', 'cpu': '250m'}
///     ..limits = {'memory': '128Mi', 'cpu': '500m'};
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/containers/)
/// for more details about container configuration.
@JsonSerializable()
class Container {
  Container({
    this.args,
    this.command,
    this.env,
    this.envFrom,
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    this.name,
    this.ports,
    this.readinessProbe,
    this.resizePolicy,
    this.resources,
    this.restartPolicy,
    this.securityContext,
    this.startupProbe,
    this.stdin,
    this.stdinOnce,
    this.terminationMessagePath,
    this.terminationMessagePolicy,
    this.tty,
    this.volumeDevices,
    this.volumeMounts,
    this.workingDir,
  });

  /// The arguments to pass to the container command
  @JsonKey(includeIfNull: false)
  List<String>? args;

  /// The command to run inside the container
  @JsonKey(includeIfNull: false)
  List<String>? command;

  /// List of environment variables to set in the container
  @JsonKey(includeIfNull: false)
  List<EnvVar>? env;

  /// List of sources to populate environment variables in the container
  @JsonKey(
      includeIfNull: false, fromJson: _envFromFromJson, toJson: _envFromToJson)
  List<EnvFromSource>? envFrom;

  /// Container image name
  @JsonKey(includeIfNull: false)
  String? image;

  /// Image pull policy: Always, Never, or IfNotPresent
  @JsonKey(includeIfNull: false)
  String? imagePullPolicy;

  /// Actions that the management system should take in response to container lifecycle events
  @JsonKey(
      includeIfNull: false,
      fromJson: _lifecycleFromJson,
      toJson: _lifecycleToJson)
  Lifecycle? lifecycle;

  /// Periodic probe of container liveness
  @JsonKey(includeIfNull: false, fromJson: _probeFromJson, toJson: _probeToJson)
  Probe? livenessProbe;

  /// Name of the container
  @JsonKey(includeIfNull: false)
  String? name;

  /// List of ports to expose from the container
  @JsonKey(includeIfNull: false)
  @ContainerPortsConverter()
  List<ContainerPort>? ports;

  /// Periodic probe of container service readiness
  @JsonKey(includeIfNull: false, fromJson: _probeFromJson, toJson: _probeToJson)
  Probe? readinessProbe;

  /// ResizePolicy defines the set of conditions that control how resize operations are handled
  @JsonKey(
      includeIfNull: false,
      fromJson: _resizePolicyFromJson,
      toJson: _resizePolicyToJson)
  List<ContainerResizePolicy>? resizePolicy;

  /// Compute resource requirements
  @JsonKey(
      includeIfNull: false,
      fromJson: _resourceRequirementsFromJson,
      toJson: _resourceRequirementsToJson)
  ResourceRequirements? resources;

  /// Restart policy for the container
  @JsonKey(includeIfNull: false)
  String? restartPolicy;

  /// Security context settings for the container
  @JsonKey(
      includeIfNull: false,
      fromJson: _securityContextFromJson,
      toJson: _securityContextToJson)
  SecurityContext? securityContext;

  /// Probe to check if the container has started
  @JsonKey(includeIfNull: false, fromJson: _probeFromJson, toJson: _probeToJson)
  Probe? startupProbe;

  /// Whether this container should allocate a buffer for stdin
  @JsonKey(includeIfNull: false)
  bool? stdin;

  /// Whether the container runtime should close the stdin channel after it has been opened by a single attach
  @JsonKey(includeIfNull: false)
  bool? stdinOnce;

  /// Path at which to write termination messages
  @JsonKey(includeIfNull: false)
  String? terminationMessagePath;

  /// Policy for handling termination messages
  @JsonKey(includeIfNull: false)
  String? terminationMessagePolicy;

  /// Whether this container should allocate a TTY
  @JsonKey(includeIfNull: false)
  bool? tty;

  /// List of block devices to be used by the container
  @JsonKey(
      includeIfNull: false,
      fromJson: _volumeDevicesFromJson,
      toJson: _volumeDevicesToJson)
  List<VolumeDevice>? volumeDevices;

  /// Pod volumes to mount into the container's filesystem
  @JsonKey(
      includeIfNull: false,
      fromJson: _volumeMountsFromJson,
      toJson: _volumeMountsToJson)
  List<VolumeMount>? volumeMounts;

  /// Container's working directory
  @JsonKey(includeIfNull: false)
  String? workingDir;

  factory Container.fromJson(Map<String, dynamic> json) =>
      _$ContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerToJson(this);
}

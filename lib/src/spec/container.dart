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
  Container({this.args, this.command, this.env, this.envFrom, this.image, this.imagePullPolicy, this.lifecycle, this.livenessProbe, this.name, this.ports, this.readinessProbe, this.resizePolicy, this.resources, this.restartPolicy, this.securityContext, this.startupProbe, this.stdin, this.stdinOnce, this.terminationMessagePath, this.terminationMessagePolicy, this.tty, this.volumeDevices, this.volumeMounts, this.workingDir});
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
  @JsonKey(includeIfNull: false)
  List<EnvFromSource>? envFrom;

  /// Container image name
  @JsonKey(includeIfNull: false)
  String? image;

  /// Image pull policy: Always, Never, or IfNotPresent
  @JsonKey(includeIfNull: false)
  String? imagePullPolicy;

  /// Actions that the management system should take in response to container lifecycle events
  @JsonKey(includeIfNull: false)
  Lifecycle? lifecycle;

  /// Periodic probe of container liveness
  @JsonKey(includeIfNull: false)
  Probe? livenessProbe;

  /// Name of the container
  @JsonKey(includeIfNull: false)
  String? name;

  /// List of ports to expose from the container
  @JsonKey(includeIfNull: false)
  @ContainerPortsConverter()
  List<ContainerPort>? ports;

  /// Periodic probe of container service readiness
  @JsonKey(includeIfNull: false)
  Probe? readinessProbe;

  /// ResizePolicy defines the set of conditions that control how resize operations are handled
  @JsonKey(includeIfNull: false)
  List<ContainerResizePolicy>? resizePolicy;

  /// Compute resource requirements
  @JsonKey(includeIfNull: false)
  ResourceRequirements? resources;

  /// Restart policy for the container
  @JsonKey(includeIfNull: false)
  String? restartPolicy;

  /// Security context settings for the container
  @JsonKey(includeIfNull: false)
  SecurityContext? securityContext;

  /// Probe to check if the container has started
  @JsonKey(includeIfNull: false)
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
  @JsonKey(includeIfNull: false)
  List<VolumeDevice>? volumeDevices;

  /// Pod volumes to mount into the container's filesystem
  @JsonKey(includeIfNull: false)
  List<VolumeMount>? volumeMounts;

  /// Container's working directory
  @JsonKey(includeIfNull: false)
  String? workingDir;

  factory Container.fromJson(Map<String, dynamic> json) =>
      _$ContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerToJson(this);
}

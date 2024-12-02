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

/// Represents a Container specification in Kubernetes.
///
/// This class maps to the Container object in the Kubernetes API (v1 Core).
/// See: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#container-v1-core
class Container {
  /// The arguments to pass to the container command
  List<String>? args;

  /// The command to run inside the container
  List<String>? command;

  /// List of environment variables to set in the container
  List<EnvVar>? env;

  /// List of sources to populate environment variables in the container
  List<EnvFromSource>? envFrom;

  /// Container image name
  String? image;

  /// Image pull policy: Always, Never, or IfNotPresent
  String? imagePullPolicy;

  /// Actions that the management system should take in response to container lifecycle events
  Lifecycle? lifecycle;

  /// Periodic probe of container liveness
  Probe? livenessProbe;

  /// Name of the container
  String? name;

  /// List of ports to expose from the container
  List<ContainerPort>? ports;

  /// Periodic probe of container service readiness
  Probe? readinessProbe;

  /// ResizePolicy defines the set of conditions that control how resize operations are handled
  List<ContainerResizePolicy>? resizePolicy;

  /// Compute resource requirements
  ResourceRequirements? resources;

  /// Restart policy for the container
  String? restartPolicy;

  /// Security context settings for the container
  SecurityContext? securityContext;

  /// Probe to check if the container has started
  Probe? startupProbe;

  /// Whether this container should allocate a buffer for stdin
  bool? stdin;

  /// Whether the container runtime should close the stdin channel after it has been opened by a single attach
  bool? stdinOnce;

  /// Path at which to write termination messages
  String? terminationMessagePath;

  /// Policy for handling termination messages
  String? terminationMessagePolicy;

  /// Whether this container should allocate a TTY
  bool? tty;

  /// List of block devices to be used by the container
  List<VolumeDevice>? volumeDevices;

  /// Pod volumes to mount into the container's filesystem
  List<VolumeMount>? volumeMounts;

  /// Container's working directory
  String? workingDir;

  /// Creates a Container instance from a Map representation.
  ///
  /// This constructor is typically used when deserializing Kubernetes YAML/JSON configurations.
  /// Each field is carefully mapped from the input data, with proper type conversion
  /// and nested object creation where necessary.
  Container.fromMap(Map<String, dynamic> data) {
    if (data['args'] != null) {
      args = [];
      for (var e in data['args']) {
        args!.add(e);
      }
    }
    if (data['command'] != null) {
      command = [];
      for (var e in data['command']) {
        command!.add(e);
      }
    }
    if (data['env'] != null) {
      env = [];
      for (var e in data['env']) {
        env!.add(EnvVar.fromMap(e));
      }
    }
    if (data['envFrom'] != null) {
      envFrom = [];
      for (var e in data['envFrom']) {
        envFrom!.add(EnvFromSource.fromMap(e));
      }
    }
    image = data['image'];
    imagePullPolicy = data['imagePullPolicy'];
    if (data['lifecycle'] != null) {
      lifecycle = Lifecycle.fromMap(data['lifecycle']);
    }
    if (data['livenessProbe'] != null) {
      livenessProbe = Probe.fromMap(data['livenessProbe']);
    }
    name = data['name'];
    if (data['ports'] != null) {
      ports = [];
      for (var e in data['ports']) {
        ports!.add(ContainerPort.fromMap(e));
      }
    }
    if (data['readinessProbe'] != null) {
      readinessProbe = Probe.fromMap(data['readinessProbe']);
    }
    if (data['resizePolicy'] != null) {
      resizePolicy = [];
      for (var e in data['resizePolicy']) {
        resizePolicy!.add(ContainerResizePolicy.fromMap(e));
      }
    }
    if (data['resources'] != null) {
      resources = ResourceRequirements.fromMap(data['resources']);
    }
    restartPolicy = data['restartPolicy'];
    if (data['securityContext'] != null) {
      securityContext = SecurityContext.fromMap(data['securityContext']);
    }
    if (data['startupProbe'] != null) {
      startupProbe = Probe.fromMap(data['startupProbe']);
    }
    stdin = data['stdin'];
    stdinOnce = data['stdinOnce'];
    terminationMessagePath = data['terminationMessagePath'];
    terminationMessagePolicy = data['terminationMessagePolicy'];
    tty = data['tty'];
    if (data['volumeDevices'] != null) {
      volumeDevices = [];
      for (var e in data['volumeDevices']) {
        volumeDevices!.add(VolumeDevice.fromMap(e));
      }
    }
    if (data['volumeMounts'] != null) {
      volumeMounts = [];
      for (var e in data['volumeMounts']) {
        volumeMounts!.add(VolumeMount.fromMap(e));
      }
    }
    workingDir = data['workingDir'];
  }

  Map<String, dynamic> toMap() => {
        'args': args,
        'command': command,
        'env': (env != null && env!.isNotEmpty)
            ? env!.map(
                (e) => e.toMap(),
              )
            : null,
        'envFrom': (envFrom != null)
            ? envFrom!.map(
                (e) => e.toMap(),
              )
            : null,
        'image': image,
        'imagePullPolicy': imagePullPolicy,
        'lifecycle': (lifecycle != null) ? lifecycle!.toMap() : null,
        'livenessProbe':
            (livenessProbe != null) ? livenessProbe!.toMap() : null,
        'name': name,
        'ports': (ports != null)
            ? ports!.map(
                (e) => e.toMap(),
              )
            : null,
        'readinessProbe':
            (readinessProbe != null) ? readinessProbe!.toMap() : null,
        'resizePolicy': (resizePolicy != null)
            ? resizePolicy!.map(
                (e) => e.toMap(),
              )
            : null,
        'resources': (resources != null) ? resources!.toMap() : null,
        'restartPolicy': restartPolicy,
        'securityContext':
            (securityContext != null) ? securityContext!.toMap() : null,
        'startupProbe': (startupProbe != null) ? startupProbe!.toMap() : null,
        'stdin': stdin,
        'stdinOnce': stdinOnce,
        'terminationMessagePath': terminationMessagePath,
        'terminationMessagePolicy': terminationMessagePolicy,
        'tty': tty,
        'volumeDevices': (volumeDevices != null)
            ? volumeDevices!.map(
                (e) => e.toMap(),
              )
            : null,
        'volumeMounts': (volumeMounts != null)
            ? volumeMounts!.map(
                (e) => e.toMap(),
              )
            : null,
        'workingDir': workingDir,
      }..removeWhere(
          (key, value) => value == null,
        );
}

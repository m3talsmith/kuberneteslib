import 'env_from_source.dart';
import 'env_var.dart';
import 'lifecycle.dart';
import 'probe.dart';

/// Represents an ephemeral container in Kubernetes.
///
/// Ephemeral containers are temporary containers that may be added to an existing pod
/// for user-initiated activities such as debugging.
class EphemeralContainer {
  /// Command-line arguments for the container.
  late List<String> args;

  /// Entrypoint array for the container.
  late List<String> command;

  /// List of environment variables to set in the container.
  late List<EnvVar> env;

  /// List of sources to populate environment variables in the container.
  late List<EnvFromSource> envFrom;

  /// Docker image name to use for this container.
  late String image;

  /// Image pull policy for the container.
  ///
  /// Can be one of: 'Always', 'Never', 'IfNotPresent'
  late String imagePullPolicy;

  /// Actions that the management system should take in response to container lifecycle events.
  late Lifecycle lifecycle;

  /// Periodic probe of container liveness.
  ///
  /// Container will be restarted if the probe fails.
  late Probe livenessProbe;

  /// Name of the ephemeral container.
  ///
  /// This name must be unique among all containers in the pod.
  late String name;

  /// Creates an [EphemeralContainer] instance from a map of data.
  ///
  /// The [data] parameter should contain all the necessary fields to initialize
  /// the container's properties.
  EphemeralContainer.fromMap(Map<String, dynamic> data) {
    args = data['args'] as List<String>;
    command = data['command'] as List<String>;
    env = (data['env'] as List<Map<String, dynamic>>)
        .map(
          (e) => EnvVar.fromMap(e),
        )
        .toList();
    envFrom = (data['envFrom'] as List<Map<String, dynamic>>)
        .map(
          (e) => EnvFromSource.fromMap(e),
        )
        .toList();
    image = data['image'];
    imagePullPolicy = data['imagePullPolicy'];
    lifecycle = Lifecycle.fromMap(data['lifecycle']);
    livenessProbe = Probe.fromMap(data['livenessProbe']);
    name = data['name'];
  }

  Map<String, dynamic> toMap() => {
        'args': args,
        'command': command,
        'env': env.map(
          (e) => e.toMap(),
        ),
        'envFrom': envFrom.map(
          (e) => e.toMap(),
        ),
        'image': image,
        'imagePullPolicy': imagePullPolicy,
        'lifecycle': lifecycle.toMap(),
        'livenessProbe': livenessProbe.toMap(),
        'name': name,
      };
}

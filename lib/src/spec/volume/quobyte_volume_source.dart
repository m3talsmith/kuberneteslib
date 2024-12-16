import 'package:json_annotation/json_annotation.dart';

part 'quobyte_volume_source.g.dart';

/// Represents a Quobyte volume in Kubernetes for software-defined storage.
///
/// QuobyteVolumeSource enables pods to use Quobyte distributed storage.
/// Key features include:
/// - Software-defined storage
/// - Multi-tenant support
/// - Access control
/// - High availability
/// - Scale-out architecture
///
/// Common use cases:
/// - Enterprise storage
/// - Multi-user environments
/// - High-performance workloads
/// - Cloud-native applications
///
/// Example:
/// ```dart
/// final quobyteVolume = QuobyteVolumeSource()
///   ..registry = 'registry.example.com:7861'
///   ..volume = 'testVolume'
///   ..user = 'admin'
///   ..group = 'admin'
///   ..tenant = 'development'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#quobyte)
/// for more details about Quobyte volumes.
@JsonSerializable()
class QuobyteVolumeSource {
  QuobyteVolumeSource();

  /// The group to map volume access to.
  ///
  /// Required: Specifies the group name or GID for volume access control.
  String? group;

  /// Controls read-only access to the volume.
  ///
  /// When true, the volume will be mounted read-only.
  /// When false, the volume will be mounted with read-write permissions.
  bool? readOnly;

  /// The Quobyte registry addresses for volume management.
  ///
  /// Required: Format is "host:port" or multiple entries comma separated.
  /// Example: "registry-1:7861,registry-2:7861"
  String? registry;

  /// The tenant for volume access.
  ///
  /// Optional: Specifies the tenant for multi-tenant environments.
  /// If not specified, the default tenant will be used.
  String? tenant;

  /// The user to map volume access to.
  ///
  /// Required: Specifies the username or UID for volume access control.
  String? user;

  /// The name of the Quobyte volume to mount.
  ///
  /// Required: Must be a valid volume name in the Quobyte storage system.
  String? volume;

  factory QuobyteVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$QuobyteVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$QuobyteVolumeSourceToJson(this);
}

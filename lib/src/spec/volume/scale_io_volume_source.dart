import '../../spec/local_object_reference.dart';

import 'package:json_annotation/json_annotation.dart';

part 'scale_io_volume_source.g.dart';

Map<String, dynamic>? _secretRefToJson(LocalObjectReference? ref) =>
    ref?.toJson();

LocalObjectReference? _secretRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : LocalObjectReference.fromJson(json);

/// Represents a ScaleIO persistent volume source in Kubernetes.
/// ScaleIO is a software-defined storage platform that creates a virtual SAN from server-based storage.
@JsonSerializable()
class ScaleIOVolumeSource {
  ScaleIOVolumeSource({
    required this.fsType,
    required this.gateway,
    required this.protectionDomain,
    required this.readOnly,
    required this.secretRef,
    required this.sslEnabled,
    required this.storageMode,
    required this.storagePool,
    required this.system,
    required this.volumeName,
  });

  /// The filesystem type to mount.
  /// Must be a filesystem type supported by the host operating system.
  String fsType;

  /// The ScaleIO Gateway endpoint.
  String gateway;

  /// The name of the ScaleIO Protection Domain for the configured storage.
  String protectionDomain;

  /// Specifies whether the volume should be mounted read-only.
  bool readOnly;

  /// Reference to the secret object containing sensitive information
  /// such as ScaleIO user credentials.
  @JsonKey(includeIfNull: false, toJson: _secretRefToJson, fromJson: _secretRefFromJson)
  LocalObjectReference? secretRef;

  /// Flag to enable/disable SSL communication with Gateway.
  bool sslEnabled;

  /// Indicates whether the storage for a volume should be thick or thin.
  String storageMode;

  /// The ScaleIO Storage Pool associated with the protection domain.
  String storagePool;

  /// The name of the storage system as configured in ScaleIO.
  String system;

  /// The name of a volume already created in the ScaleIO system.
  String volumeName;

  factory ScaleIOVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$ScaleIOVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleIOVolumeSourceToJson(this);
}

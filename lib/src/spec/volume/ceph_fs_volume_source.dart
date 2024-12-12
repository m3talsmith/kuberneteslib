import '../local_object_reference.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ceph_fs_volume_source.g.dart';

/// Represents a CephFS volume that can be mounted in Kubernetes pods.
///
/// CephFSVolumeSource enables pods to use CephFS volumes for distributed storage.
/// Key features include:
/// - Distributed filesystem support
/// - Multiple monitor configuration
/// - Custom root directory mounting
/// - Authentication via keyring or secret
///
/// Common use cases:
/// - Distributed application storage
/// - Shared file systems across pods
/// - High-performance storage requirements
///
/// Example:
/// ```dart
/// final cephfs = CephFSVolumeSource()
///   ..monitors = ['10.16.154.78:6789', '10.16.154.82:6789']
///   ..path = '/mysql_data'
///   ..user = 'admin'
///   ..secretRef = LocalObjectReference()..name = 'ceph-secret'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#cephfs)
/// for more details about CephFS volumes.

Map<String, dynamic>? _secretRefToJson(LocalObjectReference? ref) =>
    ref?.toJson();

LocalObjectReference? _secretRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : LocalObjectReference.fromJson(json);

@JsonSerializable()
class CephFSVolumeSource {
  CephFSVolumeSource({this.monitors, this.path, this.readOnly, this.secretFile, this.secretRef, this.user});

  /// Required list of CephFS monitors.
  /// 
  /// Specifies the Ceph monitors' IP addresses and ports.
  /// Example: ['10.16.154.78:6789']
  List<String>? monitors;

  /// Root of the CephFS tree to mount.
  /// 
  /// Specifies which directory in the CephFS filesystem to mount.
  /// Defaults to "/" if not specified.
  String? path;

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  bool? readOnly;

  /// Path to the CephFS keyring file.
  /// 
  /// Alternative to using secretRef for authentication.
  String? secretFile;

  /// Reference to the authentication secret.
  /// 
  /// Contains credentials for accessing CephFS.
  /// Takes precedence over secretFile if both are specified.
  @JsonKey(toJson: _secretRefToJson, fromJson: _secretRefFromJson)
  LocalObjectReference? secretRef;

  /// CephFS user for authentication.
  /// 
  /// Specifies which Ceph user to authenticate as.
  /// Defaults to 'admin' if not specified.
  String? user;

  factory CephFSVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$CephFSVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$CephFSVolumeSourceToJson(this);
}

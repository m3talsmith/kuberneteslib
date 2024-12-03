import 'package:json_annotation/json_annotation.dart';

import '../local_object_reference.dart';

part 'iscsi_volume_source.g.dart';
/// Represents an iSCSI volume in Kubernetes for block storage access.
///
/// ISCSIVolumeSource enables pods to use iSCSI (Internet Small Computer Systems
/// Interface) volumes. Key features include:
/// - Remote block storage access
/// - CHAP authentication support
/// - Multi-path support via portals
/// - Read-only mount options
///
/// Common use cases:
/// - Enterprise storage integration
/// - Database storage
/// - High-performance block storage
/// - Legacy storage systems
///
/// Example:
/// ```dart
/// final iscsiVolume = ISCSIVolumeSource()
///   ..targetPortal = '10.0.0.1:3260'
///   ..iqn = 'iqn.2000-01.com.synology:data.target-1'
///   ..lun = 0
///   ..fsType = 'ext4'
///   ..readOnly = false
///   ..chapAuthDiscovery = true
///   ..chapAuthSession = true
///   ..initiatorName = 'iqn.1994-05.com.redhat:client'
///   ..portals = ['10.0.0.2:3260']
///   ..secretRef = LocalObjectReference()..name = 'chap-secret';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#iscsi)
/// for more details about iSCSI volumes.
@JsonSerializable()
class ISCSIVolumeSource {
  ISCSIVolumeSource();

  /// Whether to perform CHAP authentication during target discovery.
  /// 
  /// When true, CHAP authentication will be used during the iSCSI
  /// discovery session.
  late bool chapAuthDiscovery;

  /// Whether to perform CHAP authentication during session establishment.
  /// 
  /// When true, CHAP authentication will be used during the iSCSI
  /// session establishment.
  late bool chapAuthSession;

  /// Filesystem type to mount on the volume.
  /// 
  /// Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs"
  late String fsType;

  /// iSCSI initiator name.
  /// 
  /// Optional: Defaults to the initiator name configured in the host.
  /// Example: "iqn.1994-05.com.redhat:client"
  late String initiatorName;

  /// iSCSI target portal Qualified Name (IQN).
  /// 
  /// Required: The target's IQN identifier.
  /// Example: "iqn.2000-01.com.synology:data.target-1"
  late String iqn;

  /// iSCSI interface name.
  /// 
  /// Optional: Defaults to 'default'.
  /// Specifies which iSCSI interface to use.
  late String iscsiInterface;

  /// iSCSI target logical unit number (LUN).
  /// 
  /// Required: The specific LUN to connect to.
  /// Example: 0
  late int lun;

  /// iSCSI target portal list.
  /// 
  /// Optional: Additional portals for multi-path support.
  /// Format: "<ip>:<port>" (default ports: 860, 3260)
  late List<String> portals;

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  late bool readOnly;

  /// Reference to the secret containing CHAP credentials.
  /// 
  /// Required if CHAP authentication is enabled.
  /// Must contain username and password.
  late LocalObjectReference secretRef;

  /// Primary iSCSI target portal.
  /// 
  /// Required: The main portal to connect to.
  /// Format: "<ip>:<port>" (default ports: 860, 3260)
  late String targetPortal;

  factory ISCSIVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$ISCSIVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ISCSIVolumeSourceToJson(this);
}

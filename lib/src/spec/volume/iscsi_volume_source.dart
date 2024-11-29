import '../local_object_reference.dart';

/// Represents an iSCSI volume source configuration in Kubernetes.
/// 
/// iSCSI (Internet Small Computer Systems Interface) is a protocol that allows
/// clients (called initiators) to send SCSI commands to SCSI storage devices
/// (targets) on remote servers.
class ISCSIVolumeSource {
  /// Whether to perform CHAP (Challenge Handshake Authentication Protocol)
  /// authentication during target discovery.
  late bool chapAuthDiscovery;

  /// Whether to perform CHAP authentication during session establishment.
  late bool chapAuthSession;

  /// The filesystem type to mount.
  /// Examples include 'ext4', 'xfs', 'ntfs'.
  late String fsType;

  /// The iSCSI initiator name.
  late String initiatorName;

  /// The target iSCSI Qualified Name (IQN).
  late String iqn;

  /// The iSCSI interface name that uses an iSCSI transport.
  late String iscsiInterface;

  /// The iSCSI Target Lun number.
  late int lun;

  /// The iSCSI Target Portal List.
  /// The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
  late List<String> portals;

  /// Whether the volume should be mounted read-only.
  late bool readOnly;

  /// Reference to the secret containing CHAP authentication credentials.
  late LocalObjectReference secretRef;

  /// The iSCSI Target Portal.
  /// The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
  late String targetPortal;

  /// Creates an ISCSIVolumeSource from a map structure.
  /// 
  /// The map should contain all the necessary fields to configure the iSCSI volume source.
  ISCSIVolumeSource.fromMap(Map<String, dynamic> data) {
    chapAuthDiscovery = data['chapAuthDiscovery'];
    chapAuthSession = data['chapAuthSession'];
    fsType = data['fsType'];
    initiatorName = data['initiatorName'];
    iqn = data['iqn'];
    iscsiInterface = data['iscsiInterface'];
    lun = data['lun'];
    portals = data['portals'] as List<String>;
    readOnly = data['readOnly'];
    secretRef = LocalObjectReference.fromMap(data['secretRef']);
    targetPortal = data['targetPortal'];
  }
}

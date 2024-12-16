import 'package:json_annotation/json_annotation.dart';

import 'volume/aws_elastic_block_store_volume_source.dart';
import 'volume/azure_disk_volume_source.dart';
import 'volume/azure_file_volume_source.dart';
import 'volume/ceph_fs_volume_source.dart';
import 'volume/cinder_volume_source.dart';
import 'volume/config_map_volume_source.dart';
import 'volume/csi_volume_source.dart';
import 'volume/downward_api_volume_source.dart';
import 'volume/empty_dir_volume_source.dart';
import 'volume/ephemeral_volume_source.dart';
import 'volume/fc_volume_source.dart';
import 'volume/flex_volume_source.dart';
import 'volume/flocker_volume_source.dart';
import 'volume/gce_persistent_disk_volume_source.dart';
import 'volume/git_repo_volume_source.dart';
import 'volume/glusterfs_volume_source.dart';
import 'volume/host_path_volume_source.dart';
import 'volume/iscsi_volume_source.dart';
import 'volume/nfs_volume_source.dart';
import 'volume/persistent_volume_claim_volume_source.dart';
import 'volume/photon_persistent_disk_volume_source.dart';
import 'volume/portworx_volume_source.dart';
import 'volume/projected_volume_source.dart';
import 'volume/quobyte_volume_source.dart';
import 'volume/rbd_volume_source.dart';
import 'volume/scale_io_volume_source.dart';
import 'volume/secret_volume_source.dart';
import 'volume/storage_os_volume_source.dart';
import 'volume/vsphere_virtual_disk_volume_source.dart';

part 'volume.g.dart';

/// Represents a volume in Kubernetes that can be mounted by containers in a pod.
///
/// Volume defines storage that can be accessed by containers in a pod. Kubernetes
/// supports many volume types for different storage backends. Key features include:
/// - Cloud provider storage integration
/// - Local and network storage
/// - Configuration and secret mounting
/// - Ephemeral and persistent storage
///
/// Common use cases:
/// - Persistent application data
/// - Shared configuration files
/// - Cross-container data sharing
/// - Cloud storage integration
/// - Database storage
///
/// Example:
/// ```dart
/// final volume = Volume()
///   ..name = 'config-volume'
///   ..configMap = (ConfigMapVolumeSource()
///     ..name = 'app-config'
///     ..defaultMode = 420)  // 0644 in octal
///   ..emptyDir = (EmptyDirVolumeSource()
///     ..sizeLimit = '1Gi');
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/)
/// for more details about volume types and configurations.
@JsonSerializable()
class Volume {
  Volume();

  /// AWS Elastic Block Store volume configuration.
  ///
  /// Mounts an AWS EBS volume into the pod.
  @JsonKey(includeIfNull: false)
  AWSElasticBlockStoreVolumeSource? awsElasticBlockStore;

  /// Azure Disk volume configuration.
  ///
  /// Mounts an Azure Data Disk into the pod.
  @JsonKey(includeIfNull: false)
  AzureDiskVolumeSource? azureDisk;

  /// Azure File volume configuration.
  ///
  /// Mounts an Azure File Service share into the pod.
  @JsonKey(includeIfNull: false)
  AzureFileVolumeSource? azureFile;

  /// CephFS volume configuration.
  ///
  /// Mounts a CephFS volume into the pod.
  @JsonKey(includeIfNull: false)
  CephFSVolumeSource? cephfs;

  /// Cinder volume configuration (OpenStack).
  ///
  /// Mounts an OpenStack Cinder volume into the pod.
  @JsonKey(includeIfNull: false)
  CinderVolumeSource? cinder;

  /// ConfigMap volume configuration.
  ///
  /// Mounts a ConfigMap as a volume in the pod.
  @JsonKey(includeIfNull: false)
  ConfigMapVolumeSource? configMap;

  /// Container Storage Interface (CSI) volume configuration.
  ///
  /// Mounts a CSI volume into the pod.
  @JsonKey(includeIfNull: false)
  CSIVolumeSource? csi;

  /// DownwardAPI volume configuration.
  ///
  /// Makes pod and container information available as files.
  @JsonKey(includeIfNull: false)
  DownwardAPIVolumeSource? downwardAPI;

  /// EmptyDir volume configuration.
  ///
  /// Creates an empty directory for scratch space.
  @JsonKey(includeIfNull: false)
  EmptyDirVolumeSource? emptyDir;

  /// Ephemeral volume configuration.
  ///
  /// Specifies a template for an ephemeral volume.
  @JsonKey(includeIfNull: false)
  EphemeralVolumeSource? ephemeral;

  /// Fibre Channel volume configuration.
  ///
  /// Mounts a Fibre Channel volume into the pod.
  @JsonKey(includeIfNull: false)
  FCVolumeSource? fc;

  /// FlexVolume configuration.
  ///
  /// Mounts a flexible volume driver volume.
  @JsonKey(includeIfNull: false)
  FlexVolumeSource? flexVolume;

  /// Flocker volume configuration.
  ///
  /// Mounts a Flocker volume into the pod.
  @JsonKey(includeIfNull: false)
  FlockerVolumeSource? flocker;

  /// Google Compute Engine Persistent Disk configuration.
  ///
  /// Mounts a GCE PD into the pod.
  @JsonKey(includeIfNull: false)
  GCEPersistentDiskVolumeSource? gcePersistentDisk;

  /// GitRepo volume configuration (deprecated).
  ///
  /// Mounts a git repository into the pod.
  @JsonKey(includeIfNull: false)
  GitRepoVolumeSource? gitRepo;

  /// GlusterFS volume configuration.
  ///
  /// Mounts a GlusterFS volume into the pod.
  @JsonKey(includeIfNull: false)
  GlusterfsVolumeSource? glusterfs;

  /// HostPath volume configuration.
  ///
  /// Mounts a directory from the host into the pod.
  @JsonKey(includeIfNull: false)
  HostPathVolumeSource? hostPath;

  /// iSCSI volume configuration.
  ///
  /// Mounts an iSCSI volume into the pod.
  @JsonKey(includeIfNull: false)
  ISCSIVolumeSource? iscsi;

  /// Name of the volume.
  ///
  /// Must be unique within the pod.
  @JsonKey(includeIfNull: false)
  String? name;

  /// NFS volume configuration.
  ///
  /// Mounts an NFS share into the pod.
  @JsonKey(includeIfNull: false)
  NFSVolumeSource? nfs;

  /// PersistentVolumeClaim configuration.
  ///
  /// References a PersistentVolumeClaim in the pod's namespace.
  @JsonKey(includeIfNull: false)
  PersistentVolumeClaimVolumeSource? persistentVolumeClaim;

  /// PhotonController persistent disk configuration.
  ///
  /// Mounts a Photon Controller persistent disk into the pod.
  @JsonKey(includeIfNull: false)
  PhotonPersistentDiskVolumeSource? photonPersistentDisk;

  /// Portworx volume configuration.
  ///
  /// Mounts a Portworx volume into the pod.
  @JsonKey(includeIfNull: false)
  PortworxVolumeSource? portworxVolume;

  /// Projected volume configuration.
  ///
  /// Projects multiple volume sources into the same directory.
  @JsonKey(includeIfNull: false)
  ProjectedVolumeSource? projected;

  /// Quobyte volume configuration.
  ///
  /// Mounts a Quobyte volume into the pod.
  @JsonKey(includeIfNull: false)
  QuobyteVolumeSource? quobyte;

  /// Rados Block Device (RBD) volume configuration.
  ///
  /// Mounts a Ceph RBD volume into the pod.
  @JsonKey(includeIfNull: false)
  RBDVolumeSource? rbd;

  /// ScaleIO volume configuration.
  ///
  /// Mounts a ScaleIO volume into the pod.
  @JsonKey(includeIfNull: false)
  ScaleIOVolumeSource? scaleIO;

  /// Secret volume configuration.
  ///
  /// Mounts a secret as a volume in the pod.
  @JsonKey(includeIfNull: false)
  SecretVolumeSource? secret;

  /// StorageOS volume configuration.
  ///
  /// Mounts a StorageOS volume into the pod.
  @JsonKey(includeIfNull: false)
  StorageOSVolumeSource? storageos;

  /// VMware vSphere volume configuration.
  ///
  /// Mounts a vSphere VMDK volume into the pod.
  @JsonKey(includeIfNull: false)
  VsphereVirtualDiskVolumeSource? vsphereVolume;

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

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
  Volume({
    this.awsElasticBlockStore,
    this.azureDisk,
    this.azureFile,
    this.cephfs,
    this.cinder,
    this.configMap,
    this.csi,
    this.downwardAPI,
    this.emptyDir,
    this.ephemeral,
  });

  /// AWS Elastic Block Store volume configuration.
  ///
  /// Mounts an AWS EBS volume into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _awsElasticBlockStoreFromJson,
      toJson: _awsElasticBlockStoreToJson)
  AWSElasticBlockStoreVolumeSource? awsElasticBlockStore;

  /// Azure Disk volume configuration.
  ///
  /// Mounts an Azure Data Disk into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _azureDiskFromJson,
      toJson: _azureDiskToJson)
  AzureDiskVolumeSource? azureDisk;

  /// Azure File volume configuration.
  ///
  /// Mounts an Azure File Service share into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _azureFileFromJson,
      toJson: _azureFileToJson)
  AzureFileVolumeSource? azureFile;

  /// CephFS volume configuration.
  ///
  /// Mounts a CephFS volume into the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _cephFSFromJson, toJson: _cephFSToJson)
  CephFSVolumeSource? cephfs;

  /// Cinder volume configuration (OpenStack).
  ///
  /// Mounts an OpenStack Cinder volume into the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _cinderFromJson, toJson: _cinderToJson)
  CinderVolumeSource? cinder;

  /// ConfigMap volume configuration.
  ///
  /// Mounts a ConfigMap as a volume in the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _configMapFromJson,
      toJson: _configMapToJson)
  ConfigMapVolumeSource? configMap;

  /// Container Storage Interface (CSI) volume configuration.
  ///
  /// Mounts a CSI volume into the pod.
  @JsonKey(includeIfNull: false, fromJson: _csiFromJson, toJson: _csiToJson)
  CSIVolumeSource? csi;

  /// DownwardAPI volume configuration.
  ///
  /// Makes pod and container information available as files.
  @JsonKey(
      includeIfNull: false,
      fromJson: _downwardAPIFromJson,
      toJson: _downwardAPIToJson)
  DownwardAPIVolumeSource? downwardAPI;

  /// EmptyDir volume configuration.
  ///
  /// Creates an empty directory for scratch space.
  @JsonKey(
      includeIfNull: false,
      fromJson: _emptyDirFromJson,
      toJson: _emptyDirToJson)
  EmptyDirVolumeSource? emptyDir;

  /// Ephemeral volume configuration.
  ///
  /// Specifies a template for an ephemeral volume.
  @JsonKey(
      includeIfNull: false,
      fromJson: _ephemeralFromJson,
      toJson: _ephemeralToJson)
  EphemeralVolumeSource? ephemeral;

  /// Fibre Channel volume configuration.
  ///
  /// Mounts a Fibre Channel volume into the pod.
  @JsonKey(includeIfNull: false, fromJson: _fcFromJson, toJson: _fcToJson)
  FCVolumeSource? fc;

  /// FlexVolume configuration.
  ///
  /// Mounts a flexible volume driver volume.
  @JsonKey(
      includeIfNull: false,
      fromJson: _flexVolumeFromJson,
      toJson: _flexVolumeToJson)
  FlexVolumeSource? flexVolume;

  /// Flocker volume configuration.
  ///
  /// Mounts a Flocker volume into the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _flockerFromJson, toJson: _flockerToJson)
  FlockerVolumeSource? flocker;

  /// Google Compute Engine Persistent Disk configuration.
  ///
  /// Mounts a GCE PD into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _gcePersistentDiskFromJson,
      toJson: _gcePersistentDiskToJson)
  GCEPersistentDiskVolumeSource? gcePersistentDisk;

  /// GitRepo volume configuration (deprecated).
  ///
  /// Mounts a git repository into the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _gitRepoFromJson, toJson: _gitRepoToJson)
  GitRepoVolumeSource? gitRepo;

  /// GlusterFS volume configuration.
  ///
  /// Mounts a GlusterFS volume into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _glusterfsFromJson,
      toJson: _glusterfsToJson)
  GlusterfsVolumeSource? glusterfs;

  /// HostPath volume configuration.
  ///
  /// Mounts a directory from the host into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _hostPathFromJson,
      toJson: _hostPathToJson)
  HostPathVolumeSource? hostPath;

  /// iSCSI volume configuration.
  ///
  /// Mounts an iSCSI volume into the pod.
  @JsonKey(includeIfNull: false, fromJson: _iscsiFromJson, toJson: _iscsiToJson)
  ISCSIVolumeSource? iscsi;

  /// Name of the volume.
  ///
  /// Must be unique within the pod.
  @JsonKey(includeIfNull: false)
  String? name;

  /// NFS volume configuration.
  ///
  /// Mounts an NFS share into the pod.
  @JsonKey(includeIfNull: false, fromJson: _nfsFromJson, toJson: _nfsToJson)
  NFSVolumeSource? nfs;

  /// PersistentVolumeClaim configuration.
  ///
  /// References a PersistentVolumeClaim in the pod's namespace.
  @JsonKey(
      includeIfNull: false,
      fromJson: _persistentVolumeClaimFromJson,
      toJson: _persistentVolumeClaimToJson)
  PersistentVolumeClaimVolumeSource? persistentVolumeClaim;

  /// PhotonController persistent disk configuration.
  ///
  /// Mounts a Photon Controller persistent disk into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _photonPersistentDiskFromJson,
      toJson: _photonPersistentDiskToJson)
  PhotonPersistentDiskVolumeSource? photonPersistentDisk;

  /// Portworx volume configuration.
  ///
  /// Mounts a Portworx volume into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _portworxVolumeFromJson,
      toJson: _portworxVolumeToJson)
  PortworxVolumeSource? portworxVolume;

  /// Projected volume configuration.
  ///
  /// Projects multiple volume sources into the same directory.
  @JsonKey(
      includeIfNull: false,
      fromJson: _projectedFromJson,
      toJson: _projectedToJson)
  ProjectedVolumeSource? projected;

  /// Quobyte volume configuration.
  ///
  /// Mounts a Quobyte volume into the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _quobyteFromJson, toJson: _quobyteToJson)
  QuobyteVolumeSource? quobyte;

  /// Rados Block Device (RBD) volume configuration.
  ///
  /// Mounts a Ceph RBD volume into the pod.
  @JsonKey(includeIfNull: false, fromJson: _rbdFromJson, toJson: _rbdToJson)
  RBDVolumeSource? rbd;

  /// ScaleIO volume configuration.
  ///
  /// Mounts a ScaleIO volume into the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _scaleIOFromJson, toJson: _scaleIOToJson)
  ScaleIOVolumeSource? scaleIO;

  /// Secret volume configuration.
  ///
  /// Mounts a secret as a volume in the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _secretFromJson, toJson: _secretToJson)
  SecretVolumeSource? secret;

  /// StorageOS volume configuration.
  ///
  /// Mounts a StorageOS volume into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _storageOSFromJson,
      toJson: _storageOSToJson)
  StorageOSVolumeSource? storageos;

  /// VMware vSphere volume configuration.
  ///
  /// Mounts a vSphere VMDK volume into the pod.
  @JsonKey(
      includeIfNull: false,
      fromJson: _vsphereVolumeFromJson,
      toJson: _vsphereVolumeToJson)
  VsphereVirtualDiskVolumeSource? vsphereVolume;

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

// Add conversion functions for all volume types
AWSElasticBlockStoreVolumeSource? _awsElasticBlockStoreFromJson(
        Map<String, dynamic>? json) =>
    json == null ? null : AWSElasticBlockStoreVolumeSource.fromJson(json);
Map<String, dynamic>? _awsElasticBlockStoreToJson(
        AWSElasticBlockStoreVolumeSource? instance) =>
    instance?.toJson();

AzureDiskVolumeSource? _azureDiskFromJson(Map<String, dynamic>? json) =>
    json == null ? null : AzureDiskVolumeSource.fromJson(json);
Map<String, dynamic>? _azureDiskToJson(AzureDiskVolumeSource? instance) =>
    instance?.toJson();

AzureFileVolumeSource? _azureFileFromJson(Map<String, dynamic>? json) =>
    json == null ? null : AzureFileVolumeSource.fromJson(json);
Map<String, dynamic>? _azureFileToJson(AzureFileVolumeSource? instance) =>
    instance?.toJson();

CephFSVolumeSource? _cephFSFromJson(Map<String, dynamic>? json) =>
    json == null ? null : CephFSVolumeSource.fromJson(json);
Map<String, dynamic>? _cephFSToJson(CephFSVolumeSource? instance) =>
    instance?.toJson();

CinderVolumeSource? _cinderFromJson(Map<String, dynamic>? json) =>
    json == null ? null : CinderVolumeSource.fromJson(json);
Map<String, dynamic>? _cinderToJson(CinderVolumeSource? instance) =>
    instance?.toJson();

ConfigMapVolumeSource? _configMapFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ConfigMapVolumeSource.fromJson(json);
Map<String, dynamic>? _configMapToJson(ConfigMapVolumeSource? instance) =>
    instance?.toJson();

CSIVolumeSource? _csiFromJson(Map<String, dynamic>? json) =>
    json == null ? null : CSIVolumeSource.fromJson(json);
Map<String, dynamic>? _csiToJson(CSIVolumeSource? instance) =>
    instance?.toJson();

DownwardAPIVolumeSource? _downwardAPIFromJson(Map<String, dynamic>? json) =>
    json == null ? null : DownwardAPIVolumeSource.fromJson(json);
Map<String, dynamic>? _downwardAPIToJson(DownwardAPIVolumeSource? instance) =>
    instance?.toJson();

EmptyDirVolumeSource? _emptyDirFromJson(Map<String, dynamic>? json) =>
    json == null ? null : EmptyDirVolumeSource.fromJson(json);
Map<String, dynamic>? _emptyDirToJson(EmptyDirVolumeSource? instance) =>
    instance?.toJson();

EphemeralVolumeSource? _ephemeralFromJson(Map<String, dynamic>? json) =>
    json == null ? null : EphemeralVolumeSource.fromJson(json);
Map<String, dynamic>? _ephemeralToJson(EphemeralVolumeSource? instance) =>
    instance?.toJson();

FCVolumeSource? _fcFromJson(Map<String, dynamic>? json) =>
    json == null ? null : FCVolumeSource.fromJson(json);
Map<String, dynamic>? _fcToJson(FCVolumeSource? instance) => instance?.toJson();

FlexVolumeSource? _flexVolumeFromJson(Map<String, dynamic>? json) =>
    json == null ? null : FlexVolumeSource.fromJson(json);
Map<String, dynamic>? _flexVolumeToJson(FlexVolumeSource? instance) =>
    instance?.toJson();

FlockerVolumeSource? _flockerFromJson(Map<String, dynamic>? json) =>
    json == null ? null : FlockerVolumeSource.fromJson(json);
Map<String, dynamic>? _flockerToJson(FlockerVolumeSource? instance) =>
    instance?.toJson();

GCEPersistentDiskVolumeSource? _gcePersistentDiskFromJson(
        Map<String, dynamic>? json) =>
    json == null ? null : GCEPersistentDiskVolumeSource.fromJson(json);
Map<String, dynamic>? _gcePersistentDiskToJson(
        GCEPersistentDiskVolumeSource? instance) =>
    instance?.toJson();

GitRepoVolumeSource? _gitRepoFromJson(Map<String, dynamic>? json) =>
    json == null ? null : GitRepoVolumeSource.fromJson(json);
Map<String, dynamic>? _gitRepoToJson(GitRepoVolumeSource? instance) =>
    instance?.toJson();

GlusterfsVolumeSource? _glusterfsFromJson(Map<String, dynamic>? json) =>
    json == null ? null : GlusterfsVolumeSource.fromJson(json);
Map<String, dynamic>? _glusterfsToJson(GlusterfsVolumeSource? instance) =>
    instance?.toJson();

HostPathVolumeSource? _hostPathFromJson(Map<String, dynamic>? json) =>
    json == null ? null : HostPathVolumeSource.fromJson(json);
Map<String, dynamic>? _hostPathToJson(HostPathVolumeSource? instance) =>
    instance?.toJson();

ISCSIVolumeSource? _iscsiFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ISCSIVolumeSource.fromJson(json);
Map<String, dynamic>? _iscsiToJson(ISCSIVolumeSource? instance) =>
    instance?.toJson();

NFSVolumeSource? _nfsFromJson(Map<String, dynamic>? json) =>
    json == null ? null : NFSVolumeSource.fromJson(json);
Map<String, dynamic>? _nfsToJson(NFSVolumeSource? instance) =>
    instance?.toJson();

PersistentVolumeClaimVolumeSource? _persistentVolumeClaimFromJson(
        Map<String, dynamic>? json) =>
    json == null ? null : PersistentVolumeClaimVolumeSource.fromJson(json);
Map<String, dynamic>? _persistentVolumeClaimToJson(
        PersistentVolumeClaimVolumeSource? instance) =>
    instance?.toJson();

PhotonPersistentDiskVolumeSource? _photonPersistentDiskFromJson(
        Map<String, dynamic>? json) =>
    json == null ? null : PhotonPersistentDiskVolumeSource.fromJson(json);
Map<String, dynamic>? _photonPersistentDiskToJson(
        PhotonPersistentDiskVolumeSource? instance) =>
    instance?.toJson();

PortworxVolumeSource? _portworxVolumeFromJson(Map<String, dynamic>? json) =>
    json == null ? null : PortworxVolumeSource.fromJson(json);
Map<String, dynamic>? _portworxVolumeToJson(PortworxVolumeSource? instance) =>
    instance?.toJson();

ProjectedVolumeSource? _projectedFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ProjectedVolumeSource.fromJson(json);
Map<String, dynamic>? _projectedToJson(ProjectedVolumeSource? instance) =>
    instance?.toJson();

QuobyteVolumeSource? _quobyteFromJson(Map<String, dynamic>? json) =>
    json == null ? null : QuobyteVolumeSource.fromJson(json);
Map<String, dynamic>? _quobyteToJson(QuobyteVolumeSource? instance) =>
    instance?.toJson();

RBDVolumeSource? _rbdFromJson(Map<String, dynamic>? json) =>
    json == null ? null : RBDVolumeSource.fromJson(json);
Map<String, dynamic>? _rbdToJson(RBDVolumeSource? instance) =>
    instance?.toJson();

ScaleIOVolumeSource? _scaleIOFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ScaleIOVolumeSource.fromJson(json);
Map<String, dynamic>? _scaleIOToJson(ScaleIOVolumeSource? instance) =>
    instance?.toJson();

SecretVolumeSource? _secretFromJson(Map<String, dynamic>? json) =>
    json == null ? null : SecretVolumeSource.fromJson(json);
Map<String, dynamic>? _secretToJson(SecretVolumeSource? instance) =>
    instance?.toJson();

StorageOSVolumeSource? _storageOSFromJson(Map<String, dynamic>? json) =>
    json == null ? null : StorageOSVolumeSource.fromJson(json);
Map<String, dynamic>? _storageOSToJson(StorageOSVolumeSource? instance) =>
    instance?.toJson();

VsphereVirtualDiskVolumeSource? _vsphereVolumeFromJson(
        Map<String, dynamic>? json) =>
    json == null ? null : VsphereVirtualDiskVolumeSource.fromJson(json);
Map<String, dynamic>? _vsphereVolumeToJson(
        VsphereVirtualDiskVolumeSource? instance) =>
    instance?.toJson();

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume()
  ..awsElasticBlockStore = json['awsElasticBlockStore'] == null
      ? null
      : AWSElasticBlockStoreVolumeSource.fromJson(
          json['awsElasticBlockStore'] as Map<String, dynamic>)
  ..azureDisk = json['azureDisk'] == null
      ? null
      : AzureDiskVolumeSource.fromJson(
          json['azureDisk'] as Map<String, dynamic>)
  ..azureFile = json['azureFile'] == null
      ? null
      : AzureFileVolumeSource.fromJson(
          json['azureFile'] as Map<String, dynamic>)
  ..cephfs = json['cephfs'] == null
      ? null
      : CephFSVolumeSource.fromJson(json['cephfs'] as Map<String, dynamic>)
  ..cinder = json['cinder'] == null
      ? null
      : CinderVolumeSource.fromJson(json['cinder'] as Map<String, dynamic>)
  ..configMap = json['configMap'] == null
      ? null
      : ConfigMapVolumeSource.fromJson(
          json['configMap'] as Map<String, dynamic>)
  ..csi = json['csi'] == null
      ? null
      : CSIVolumeSource.fromJson(json['csi'] as Map<String, dynamic>)
  ..downwardAPI = json['downwardAPI'] == null
      ? null
      : DownwardAPIVolumeSource.fromJson(
          json['downwardAPI'] as Map<String, dynamic>)
  ..emptyDir = json['emptyDir'] == null
      ? null
      : EmptyDirVolumeSource.fromJson(json['emptyDir'] as Map<String, dynamic>)
  ..ephemeral = json['ephemeral'] == null
      ? null
      : EphemeralVolumeSource.fromJson(
          json['ephemeral'] as Map<String, dynamic>)
  ..fc = json['fc'] == null
      ? null
      : FCVolumeSource.fromJson(json['fc'] as Map<String, dynamic>)
  ..flexVolume = json['flexVolume'] == null
      ? null
      : FlexVolumeSource.fromJson(json['flexVolume'] as Map<String, dynamic>)
  ..flocker = json['flocker'] == null
      ? null
      : FlockerVolumeSource.fromJson(json['flocker'] as Map<String, dynamic>)
  ..gcePersistentDisk = json['gcePersistentDisk'] == null
      ? null
      : GCEPersistentDiskVolumeSource.fromJson(
          json['gcePersistentDisk'] as Map<String, dynamic>)
  ..gitRepo = json['gitRepo'] == null
      ? null
      : GitRepoVolumeSource.fromJson(json['gitRepo'] as Map<String, dynamic>)
  ..glusterfs = json['glusterfs'] == null
      ? null
      : GlusterfsVolumeSource.fromJson(
          json['glusterfs'] as Map<String, dynamic>)
  ..hostPath = json['hostPath'] == null
      ? null
      : HostPathVolumeSource.fromJson(json['hostPath'] as Map<String, dynamic>)
  ..iscsi = json['iscsi'] == null
      ? null
      : ISCSIVolumeSource.fromJson(json['iscsi'] as Map<String, dynamic>)
  ..name = json['name'] as String?
  ..nfs = json['nfs'] == null
      ? null
      : NFSVolumeSource.fromJson(json['nfs'] as Map<String, dynamic>)
  ..persistentVolumeClaim = json['persistentVolumeClaim'] == null
      ? null
      : PersistentVolumeClaimVolumeSource.fromJson(
          json['persistentVolumeClaim'] as Map<String, dynamic>)
  ..photonPersistentDisk = json['photonPersistentDisk'] == null
      ? null
      : PhotonPersistentDiskVolumeSource.fromJson(
          json['photonPersistentDisk'] as Map<String, dynamic>)
  ..portworxVolume = json['portworxVolume'] == null
      ? null
      : PortworxVolumeSource.fromJson(
          json['portworxVolume'] as Map<String, dynamic>)
  ..projected = json['projected'] == null
      ? null
      : ProjectedVolumeSource.fromJson(
          json['projected'] as Map<String, dynamic>)
  ..quobyte = json['quobyte'] == null
      ? null
      : QuobyteVolumeSource.fromJson(json['quobyte'] as Map<String, dynamic>)
  ..rbd = json['rbd'] == null
      ? null
      : RBDVolumeSource.fromJson(json['rbd'] as Map<String, dynamic>)
  ..scaleIO = json['scaleIO'] == null
      ? null
      : ScaleIOVolumeSource.fromJson(json['scaleIO'] as Map<String, dynamic>)
  ..secret = json['secret'] == null
      ? null
      : SecretVolumeSource.fromJson(json['secret'] as Map<String, dynamic>)
  ..storageos = json['storageos'] == null
      ? null
      : StorageOSVolumeSource.fromJson(
          json['storageos'] as Map<String, dynamic>)
  ..vsphereVolume = json['vsphereVolume'] == null
      ? null
      : VsphereVirtualDiskVolumeSource.fromJson(
          json['vsphereVolume'] as Map<String, dynamic>);

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      if (instance.awsElasticBlockStore case final value?)
        'awsElasticBlockStore': value,
      if (instance.azureDisk case final value?) 'azureDisk': value,
      if (instance.azureFile case final value?) 'azureFile': value,
      if (instance.cephfs case final value?) 'cephfs': value,
      if (instance.cinder case final value?) 'cinder': value,
      if (instance.configMap case final value?) 'configMap': value,
      if (instance.csi case final value?) 'csi': value,
      if (instance.downwardAPI case final value?) 'downwardAPI': value,
      if (instance.emptyDir case final value?) 'emptyDir': value,
      if (instance.ephemeral case final value?) 'ephemeral': value,
      if (instance.fc case final value?) 'fc': value,
      if (instance.flexVolume case final value?) 'flexVolume': value,
      if (instance.flocker case final value?) 'flocker': value,
      if (instance.gcePersistentDisk case final value?)
        'gcePersistentDisk': value,
      if (instance.gitRepo case final value?) 'gitRepo': value,
      if (instance.glusterfs case final value?) 'glusterfs': value,
      if (instance.hostPath case final value?) 'hostPath': value,
      if (instance.iscsi case final value?) 'iscsi': value,
      if (instance.name case final value?) 'name': value,
      if (instance.nfs case final value?) 'nfs': value,
      if (instance.persistentVolumeClaim case final value?)
        'persistentVolumeClaim': value,
      if (instance.photonPersistentDisk case final value?)
        'photonPersistentDisk': value,
      if (instance.portworxVolume case final value?) 'portworxVolume': value,
      if (instance.projected case final value?) 'projected': value,
      if (instance.quobyte case final value?) 'quobyte': value,
      if (instance.rbd case final value?) 'rbd': value,
      if (instance.scaleIO case final value?) 'scaleIO': value,
      if (instance.secret case final value?) 'secret': value,
      if (instance.storageos case final value?) 'storageos': value,
      if (instance.vsphereVolume case final value?) 'vsphereVolume': value,
    };

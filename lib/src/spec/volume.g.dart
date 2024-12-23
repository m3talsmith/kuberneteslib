// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
      awsElasticBlockStore: _awsElasticBlockStoreFromJson(
          json['awsElasticBlockStore'] as Map<String, dynamic>?),
      azureDisk: _azureDiskFromJson(json['azureDisk'] as Map<String, dynamic>?),
      azureFile: _azureFileFromJson(json['azureFile'] as Map<String, dynamic>?),
      cephfs: _cephFSFromJson(json['cephfs'] as Map<String, dynamic>?),
      cinder: _cinderFromJson(json['cinder'] as Map<String, dynamic>?),
      configMap: _configMapFromJson(json['configMap'] as Map<String, dynamic>?),
      csi: _csiFromJson(json['csi'] as Map<String, dynamic>?),
      downwardAPI:
          _downwardAPIFromJson(json['downwardAPI'] as Map<String, dynamic>?),
      emptyDir: _emptyDirFromJson(json['emptyDir'] as Map<String, dynamic>?),
      ephemeral: _ephemeralFromJson(json['ephemeral'] as Map<String, dynamic>?),
    )
      ..fc = _fcFromJson(json['fc'] as Map<String, dynamic>?)
      ..flexVolume =
          _flexVolumeFromJson(json['flexVolume'] as Map<String, dynamic>?)
      ..flocker = _flockerFromJson(json['flocker'] as Map<String, dynamic>?)
      ..gcePersistentDisk = _gcePersistentDiskFromJson(
          json['gcePersistentDisk'] as Map<String, dynamic>?)
      ..gitRepo = _gitRepoFromJson(json['gitRepo'] as Map<String, dynamic>?)
      ..glusterfs =
          _glusterfsFromJson(json['glusterfs'] as Map<String, dynamic>?)
      ..hostPath = _hostPathFromJson(json['hostPath'] as Map<String, dynamic>?)
      ..iscsi = _iscsiFromJson(json['iscsi'] as Map<String, dynamic>?)
      ..name = json['name'] as String?
      ..nfs = _nfsFromJson(json['nfs'] as Map<String, dynamic>?)
      ..persistentVolumeClaim = _persistentVolumeClaimFromJson(
          json['persistentVolumeClaim'] as Map<String, dynamic>?)
      ..photonPersistentDisk = _photonPersistentDiskFromJson(
          json['photonPersistentDisk'] as Map<String, dynamic>?)
      ..portworxVolume = _portworxVolumeFromJson(
          json['portworxVolume'] as Map<String, dynamic>?)
      ..projected =
          _projectedFromJson(json['projected'] as Map<String, dynamic>?)
      ..quobyte = _quobyteFromJson(json['quobyte'] as Map<String, dynamic>?)
      ..rbd = _rbdFromJson(json['rbd'] as Map<String, dynamic>?)
      ..scaleIO = _scaleIOFromJson(json['scaleIO'] as Map<String, dynamic>?)
      ..secret = _secretFromJson(json['secret'] as Map<String, dynamic>?)
      ..storageos =
          _storageOSFromJson(json['storageos'] as Map<String, dynamic>?)
      ..vsphereVolume = _vsphereVolumeFromJson(
          json['vsphereVolume'] as Map<String, dynamic>?);

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      if (_awsElasticBlockStoreToJson(instance.awsElasticBlockStore)
          case final value?)
        'awsElasticBlockStore': value,
      if (_azureDiskToJson(instance.azureDisk) case final value?)
        'azureDisk': value,
      if (_azureFileToJson(instance.azureFile) case final value?)
        'azureFile': value,
      if (_cephFSToJson(instance.cephfs) case final value?) 'cephfs': value,
      if (_cinderToJson(instance.cinder) case final value?) 'cinder': value,
      if (_configMapToJson(instance.configMap) case final value?)
        'configMap': value,
      if (_csiToJson(instance.csi) case final value?) 'csi': value,
      if (_downwardAPIToJson(instance.downwardAPI) case final value?)
        'downwardAPI': value,
      if (_emptyDirToJson(instance.emptyDir) case final value?)
        'emptyDir': value,
      if (_ephemeralToJson(instance.ephemeral) case final value?)
        'ephemeral': value,
      if (_fcToJson(instance.fc) case final value?) 'fc': value,
      if (_flexVolumeToJson(instance.flexVolume) case final value?)
        'flexVolume': value,
      if (_flockerToJson(instance.flocker) case final value?) 'flocker': value,
      if (_gcePersistentDiskToJson(instance.gcePersistentDisk)
          case final value?)
        'gcePersistentDisk': value,
      if (_gitRepoToJson(instance.gitRepo) case final value?) 'gitRepo': value,
      if (_glusterfsToJson(instance.glusterfs) case final value?)
        'glusterfs': value,
      if (_hostPathToJson(instance.hostPath) case final value?)
        'hostPath': value,
      if (_iscsiToJson(instance.iscsi) case final value?) 'iscsi': value,
      if (instance.name case final value?) 'name': value,
      if (_nfsToJson(instance.nfs) case final value?) 'nfs': value,
      if (_persistentVolumeClaimToJson(instance.persistentVolumeClaim)
          case final value?)
        'persistentVolumeClaim': value,
      if (_photonPersistentDiskToJson(instance.photonPersistentDisk)
          case final value?)
        'photonPersistentDisk': value,
      if (_portworxVolumeToJson(instance.portworxVolume) case final value?)
        'portworxVolume': value,
      if (_projectedToJson(instance.projected) case final value?)
        'projected': value,
      if (_quobyteToJson(instance.quobyte) case final value?) 'quobyte': value,
      if (_rbdToJson(instance.rbd) case final value?) 'rbd': value,
      if (_scaleIOToJson(instance.scaleIO) case final value?) 'scaleIO': value,
      if (_secretToJson(instance.secret) case final value?) 'secret': value,
      if (_storageOSToJson(instance.storageos) case final value?)
        'storageos': value,
      if (_vsphereVolumeToJson(instance.vsphereVolume) case final value?)
        'vsphereVolume': value,
    };

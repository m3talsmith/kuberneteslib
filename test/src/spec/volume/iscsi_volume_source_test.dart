import 'package:kuberneteslib/src/spec/local_object_reference.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/iscsi_volume_source.dart';

void main() {
  group('ISCSIVolumeSource', () {
    test('can be instantiated', () {
      final source = ISCSIVolumeSource();
      expect(source, isNotNull);
    });

    test('can be created from JSON', () {
      final json = {
        'chapAuthDiscovery': true,
        'chapAuthSession': true,
        'fsType': 'ext4',
        'initiatorName': 'iqn.1994-05.com.redhat:client',
        'iqn': 'iqn.2000-01.com.synology:data.target-1',
        'iscsiInterface': 'default',
        'lun': 0,
        'portals': ['10.0.0.2:3260'],
        'readOnly': false,
        'secretRef': {'name': 'chap-secret'},
        'targetPortal': '10.0.0.1:3260'
      };

      final source = ISCSIVolumeSource.fromJson(json);
      
      expect(source.chapAuthDiscovery, true);
      expect(source.chapAuthSession, true);
      expect(source.fsType, 'ext4');
      expect(source.initiatorName, 'iqn.1994-05.com.redhat:client');
      expect(source.iqn, 'iqn.2000-01.com.synology:data.target-1');
      expect(source.iscsiInterface, 'default');
      expect(source.lun, 0);
      expect(source.portals, ['10.0.0.2:3260']);
      expect(source.readOnly, false);
      expect(source.secretRef?.name, 'chap-secret');
      expect(source.targetPortal, '10.0.0.1:3260');
    });

    test('can be converted to JSON', () {
      final source = ISCSIVolumeSource()
        ..chapAuthDiscovery = true
        ..chapAuthSession = true
        ..fsType = 'ext4'
        ..initiatorName = 'iqn.1994-05.com.redhat:client'
        ..iqn = 'iqn.2000-01.com.synology:data.target-1'
        ..iscsiInterface = 'default'
        ..lun = 0
        ..portals = ['10.0.0.2:3260']
        ..readOnly = false
        ..secretRef = (LocalObjectReference()..name = 'chap-secret')
        ..targetPortal = '10.0.0.1:3260';

      final json = source.toJson();
      
      expect(json, {
        'chapAuthDiscovery': true,
        'chapAuthSession': true,
        'fsType': 'ext4',
        'initiatorName': 'iqn.1994-05.com.redhat:client',
        'iqn': 'iqn.2000-01.com.synology:data.target-1',
        'iscsiInterface': 'default',
        'lun': 0,
        'portals': ['10.0.0.2:3260'],
        'readOnly': false,
        'secretRef': {'name': 'chap-secret'},
        'targetPortal': '10.0.0.1:3260'
      });
    });

    test('supports value equality', () {
      final source1 = ISCSIVolumeSource()
        ..chapAuthDiscovery = true
        ..chapAuthSession = true
        ..fsType = 'ext4'
        ..initiatorName = 'iqn.1994-05.com.redhat:client'
        ..iqn = 'iqn.2000-01.com.synology:data.target-1'
        ..iscsiInterface = 'default'
        ..lun = 0
        ..portals = ['10.0.0.2:3260']
        ..readOnly = false
        ..secretRef = (LocalObjectReference()..name = 'chap-secret')
        ..targetPortal = '10.0.0.1:3260';

      final source2 = ISCSIVolumeSource()
        ..chapAuthDiscovery = true
        ..chapAuthSession = true
        ..fsType = 'ext4'
        ..initiatorName = 'iqn.1994-05.com.redhat:client'
        ..iqn = 'iqn.2000-01.com.synology:data.target-1'
        ..iscsiInterface = 'default'
        ..lun = 0
        ..portals = ['10.0.0.2:3260']
        ..readOnly = false
        ..secretRef = (LocalObjectReference()..name = 'chap-secret')
        ..targetPortal = '10.0.0.1:3260';

      expect(source1.toJson(), equals(source2.toJson()));
    });
  });
} 
import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/flocker_volume_source.dart';

void main() {
  group('FlockerVolumeSource', () {
    late FlockerVolumeSource flockerVolume;

    setUp(() {
      flockerVolume = FlockerVolumeSource()
        ..datasetName = 'mysql-data'
        ..datasetUUID = 'b4e9d2d8-3719-11e7-be82-0242ac110004';
    });

    test('can be instantiated', () {
      expect(flockerVolume, isNotNull);
      expect(flockerVolume, isA<FlockerVolumeSource>());
    });

    test('has correct property values', () {
      expect(flockerVolume.datasetName, equals('mysql-data'));
      expect(flockerVolume.datasetUUID,
          equals('b4e9d2d8-3719-11e7-be82-0242ac110004'));
    });

    test('can be created from JSON', () {
      final json = {
        'datasetName': 'postgres-data',
        'datasetUUID': 'a1b2c3d4-5678-90ef-ghij-klmnopqrstuv'
      };

      final fromJson = FlockerVolumeSource.fromJson(json);

      expect(fromJson.datasetName, equals('postgres-data'));
      expect(
          fromJson.datasetUUID, equals('a1b2c3d4-5678-90ef-ghij-klmnopqrstuv'));
    });
  });
}

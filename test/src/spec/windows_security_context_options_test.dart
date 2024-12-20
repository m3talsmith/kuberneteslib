import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/windows_security_context_options.dart';

void main() {
  group('WindowsSecurityContextOptions', () {
    test('can be instantiated', () {
      final options = WindowsSecurityContextOptions();
      expect(options, isNotNull);
    });

    test('has correct default values', () {
      final options = WindowsSecurityContextOptions();
      expect(options.gmsaCredentialSpec, isNull);
      expect(options.gmsaCredentialSpecName, isNull);
      expect(options.hostProcess, isNull);
      expect(options.runAsUserName, isNull);
    });

    test('can be instantiated with custom values', () {
      final options = WindowsSecurityContextOptions(
        gmsaCredentialSpec: 'credSpec',
        gmsaCredentialSpecName: 'credSpecName',
        hostProcess: true,
        runAsUserName: 'NT AUTHORITY\\SYSTEM',
      );

      expect(options.gmsaCredentialSpec, equals('credSpec'));
      expect(options.gmsaCredentialSpecName, equals('credSpecName'));
      expect(options.hostProcess, isTrue);
      expect(options.runAsUserName, equals('NT AUTHORITY\\SYSTEM'));
    });

    group('serialization', () {
      test('toJson() creates correct JSON', () {
        final options = WindowsSecurityContextOptions(
          gmsaCredentialSpec: 'credSpec',
          gmsaCredentialSpecName: 'credSpecName',
          hostProcess: true,
          runAsUserName: 'NT AUTHORITY\\SYSTEM',
        );

        final json = options.toJson();

        expect(
            json,
            equals({
              'gmsaCredentialSpec': 'credSpec',
              'gmsaCredentialSpecName': 'credSpecName',
              'hostProcess': true,
              'runAsUserName': 'NT AUTHORITY\\SYSTEM',
            }));
      });

      test('toJson() omits null values', () {
        final options = WindowsSecurityContextOptions();
        final json = options.toJson();

        expect(json, isEmpty);
      });

      test('fromJson() creates correct instance', () {
        final json = {
          'gmsaCredentialSpec': 'credSpec',
          'gmsaCredentialSpecName': 'credSpecName',
          'hostProcess': true,
          'runAsUserName': 'NT AUTHORITY\\SYSTEM',
        };

        final options = WindowsSecurityContextOptions.fromJson(json);

        expect(options.gmsaCredentialSpec, equals('credSpec'));
        expect(options.gmsaCredentialSpecName, equals('credSpecName'));
        expect(options.hostProcess, isTrue);
        expect(options.runAsUserName, equals('NT AUTHORITY\\SYSTEM'));
      });

      test('fromJson() handles missing values', () {
        final json = <String, dynamic>{};
        final options = WindowsSecurityContextOptions.fromJson(json);

        expect(options.gmsaCredentialSpec, isNull);
        expect(options.gmsaCredentialSpecName, isNull);
        expect(options.hostProcess, isNull);
        expect(options.runAsUserName, isNull);
      });
    });
  });
}

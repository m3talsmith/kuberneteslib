import 'package:kuberneteslib/src/spec/windows_security_context_options.dart';
import 'package:test/test.dart';

void main() {
  group('WindowsSecurityContextOptions', () {
    test('can be instantiated', () {
      final options = WindowsSecurityContextOptions();
      expect(options, isNotNull);
    });

    test('supports JSON serialization', () {
      final options = WindowsSecurityContextOptions(
        gmsaCredentialSpec: '{"credential": "spec"}',
        gmsaCredentialSpecName: 'webapp-gmsa',
        hostProcess: true,
        runAsUserName: 'NT AUTHORITY\\SYSTEM',
      );

      final json = options.toJson();
      expect(json, {
        'gmsaCredentialSpec': '{"credential": "spec"}',
        'gmsaCredentialSpecName': 'webapp-gmsa',
        'hostProcess': true,
        'runAsUserName': 'NT AUTHORITY\\SYSTEM',
      });
    });

    test('supports JSON deserialization', () {
      final json = {
        'gmsaCredentialSpec': '{"credential": "spec"}',
        'gmsaCredentialSpecName': 'webapp-gmsa',
        'hostProcess': true,
        'runAsUserName': 'NT AUTHORITY\\SYSTEM',
      };

      final options = WindowsSecurityContextOptions.fromJson(json);
      expect(options.gmsaCredentialSpec, '{"credential": "spec"}');
      expect(options.gmsaCredentialSpecName, 'webapp-gmsa');
      expect(options.hostProcess, true);
      expect(options.runAsUserName, 'NT AUTHORITY\\SYSTEM');
    });

    test('excludes null values during serialization', () {
      final options = WindowsSecurityContextOptions(
        gmsaCredentialSpec: null,
        gmsaCredentialSpecName: 'webapp-gmsa',
        hostProcess: null,
        runAsUserName: null,
      );

      final json = options.toJson();
      expect(json, {
        'gmsaCredentialSpecName': 'webapp-gmsa',
      });
      expect(json.containsKey('gmsaCredentialSpec'), false);
      expect(json.containsKey('hostProcess'), false);
      expect(json.containsKey('runAsUserName'), false);
    });

    test('handles empty initialization', () {
      final options = WindowsSecurityContextOptions();
      final json = options.toJson();
      expect(json, isEmpty);
    });

    test('supports common Windows service accounts', () {
      final serviceAccounts = [
        'NT AUTHORITY\\SYSTEM',
        'NT AUTHORITY\\LOCAL SERVICE',
        'NT AUTHORITY\\NETWORK SERVICE',
      ];

      for (final account in serviceAccounts) {
        final options = WindowsSecurityContextOptions(runAsUserName: account);
        final json = options.toJson();
        expect(json['runAsUserName'], account);
      }
    });
  });
}

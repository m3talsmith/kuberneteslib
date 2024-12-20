import 'package:kuberneteslib/src/spec/pod_security_context.dart';
import 'package:kuberneteslib/src/spec/se_linux_options.dart';
import 'package:kuberneteslib/src/spec/seccomp_profile.dart';
import 'package:kuberneteslib/src/spec/sysctl.dart';
import 'package:kuberneteslib/src/spec/windows_security_context_options.dart';
import 'package:test/test.dart';

void main() {
  group('PodSecurityContext', () {
    test('can be instantiated', () {
      final context = PodSecurityContext();
      expect(context, isNotNull);
    });

    test('supports all fields', () {
      final context = PodSecurityContext()
        ..fsGroup = 2000
        ..fsGroupChangePolicy = 'OnRootMismatch'
        ..runAsGroup = 3000
        ..runAsNonRoot = true
        ..runAsUser = 1000
        ..seLinuxOptions = (SELinuxOptions()..level = 'level')
        ..seccompProfile = (SeccompProfile()..type = 'RuntimeDefault')
        ..supplementalGroups = [4000, 5000]
        ..sysctls = [Sysctl(name: 'kernel.shm_rmid_forced', value: '0')]
        ..windowsOptions =
            WindowsSecurityContextOptions(gmsaCredentialSpecName: 'spec');

      expect(context.fsGroup, equals(2000));
      expect(context.fsGroupChangePolicy, equals('OnRootMismatch'));
      expect(context.runAsGroup, equals(3000));
      expect(context.runAsNonRoot, isTrue);
      expect(context.runAsUser, equals(1000));
      expect(context.seLinuxOptions?.level, equals('level'));
      expect(context.seccompProfile?.type, equals('RuntimeDefault'));
      expect(context.supplementalGroups, equals([4000, 5000]));
      expect(context.sysctls?.first.name, equals('kernel.shm_rmid_forced'));
      expect(context.windowsOptions?.gmsaCredentialSpecName, equals('spec'));
    });

    group('JSON serialization', () {
      test('toJson includes non-null values', () {
        final context = PodSecurityContext()
          ..fsGroup = 2000
          ..runAsNonRoot = true;

        final json = context.toJson();
        expect(json, {
          'fsGroup': 2000,
          'runAsNonRoot': true,
        });
      });

      test('toJson excludes null values', () {
        final context = PodSecurityContext();
        final json = context.toJson();
        expect(json, isEmpty);
      });

      test('fromJson creates correct instance', () {
        final json = {
          'fsGroup': 2000,
          'runAsNonRoot': true,
          'supplementalGroups': [3000, 4000],
          'seLinuxOptions': {'level': 'test'},
          'seccompProfile': {'type': 'RuntimeDefault'},
          'sysctls': [
            {'name': 'kernel.shm_rmid_forced', 'value': '0'}
          ],
          'windowsOptions': {'gmsaCredentialSpecName': 'spec'}
        };

        final context = PodSecurityContext.fromJson(json);

        expect(context.fsGroup, equals(2000));
        expect(context.runAsNonRoot, isTrue);
        expect(context.supplementalGroups, equals([3000, 4000]));
        expect(context.seLinuxOptions?.level, equals('test'));
        expect(context.seccompProfile?.type, equals('RuntimeDefault'));
        expect(context.sysctls?.first.name, equals('kernel.shm_rmid_forced'));
        expect(context.windowsOptions?.gmsaCredentialSpecName, equals('spec'));
      });
    });
  });
}

import 'package:kuberneteslib/src/spec/security_context.dart';
import 'package:kuberneteslib/src/spec/capabilities.dart';
import 'package:kuberneteslib/src/spec/se_linux_options.dart';
import 'package:kuberneteslib/src/spec/seccomp_profile.dart';
import 'package:kuberneteslib/src/spec/windows_security_context_options.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityContext', () {
    test('can be instantiated', () {
      final securityContext = SecurityContext();
      expect(securityContext, isNotNull);
    });

    test('supports JSON serialization', () {
      final securityContext = SecurityContext()
        ..allowPrivilegeEscalation = false
        ..privileged = true
        ..procMount = 'Default'
        ..readOnlyRootFilesystem = true
        ..runAsGroup = 1000
        ..runAsNonRoot = true
        ..runAsUser = 2000;

      final json = securityContext.toJson();
      final deserialized = SecurityContext.fromJson(json);

      expect(deserialized.allowPrivilegeEscalation, false);
      expect(deserialized.privileged, true);
      expect(deserialized.procMount, 'Default');
      expect(deserialized.readOnlyRootFilesystem, true);
      expect(deserialized.runAsGroup, 1000);
      expect(deserialized.runAsNonRoot, true);
      expect(deserialized.runAsUser, 2000);
    });

    test('supports null values', () {
      final securityContext = SecurityContext();
      final json = securityContext.toJson();

      expect(json, isEmpty);
    });

    test('handles capabilities', () {
      final securityContext = SecurityContext()
        ..capabilities = (Capabilities()
          ..add = ['NET_ADMIN']
          ..drop = ['ALL']);

      final json = securityContext.toJson();
      final deserialized = SecurityContext.fromJson(json);

      expect(deserialized.capabilities?.add, ['NET_ADMIN']);
      expect(deserialized.capabilities?.drop, ['ALL']);
    });

    test('handles SELinux options', () {
      final securityContext = SecurityContext()
        ..seLinuxOptions = (SELinuxOptions()
          ..level = 's0:c123,c456'
          ..role = 'object_r'
          ..type = 'svirt_sandbox_file_t'
          ..user = 'system_u');

      final json = securityContext.toJson();
      final deserialized = SecurityContext.fromJson(json);

      expect(deserialized.seLinuxOptions?.level, 's0:c123,c456');
      expect(deserialized.seLinuxOptions?.role, 'object_r');
      expect(deserialized.seLinuxOptions?.type, 'svirt_sandbox_file_t');
      expect(deserialized.seLinuxOptions?.user, 'system_u');
    });

    test('handles seccomp profile', () {
      final securityContext = SecurityContext()
        ..seccompProfile = (SeccompProfile()..type = 'RuntimeDefault');

      final json = securityContext.toJson();
      final deserialized = SecurityContext.fromJson(json);

      expect(deserialized.seccompProfile?.type, 'RuntimeDefault');
    });

    test('handles Windows options', () {
      final securityContext = SecurityContext()
        ..windowsOptions = (WindowsSecurityContextOptions()
          ..gmsaCredentialSpec = 'credential-spec'
          ..gmsaCredentialSpecName = 'credential-spec-name'
          ..hostProcess = false
          ..runAsUserName = 'ContainerUser');

      final json = securityContext.toJson();
      final deserialized = SecurityContext.fromJson(json);

      expect(
          deserialized.windowsOptions?.gmsaCredentialSpec, 'credential-spec');
      expect(deserialized.windowsOptions?.gmsaCredentialSpecName,
          'credential-spec-name');
      expect(deserialized.windowsOptions?.hostProcess, false);
      expect(deserialized.windowsOptions?.runAsUserName, 'ContainerUser');
    });
  });
}

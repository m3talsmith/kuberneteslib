import 'package:kuberneteslib/src/spec/se_linux_options.dart';
import 'package:test/test.dart';

void main() {
  group('SELinuxOptions', () {
    test('can be instantiated', () {
      final seLinux = SELinuxOptions();
      expect(seLinux, isNotNull);
    });

    test('supports value assignment', () {
      final seLinux = SELinuxOptions()
        ..user = 'system_u'
        ..role = 'system_r'
        ..type = 'container_t'
        ..level = 's0:c123,c456';

      expect(seLinux.user, equals('system_u'));
      expect(seLinux.role, equals('system_r'));
      expect(seLinux.type, equals('container_t'));
      expect(seLinux.level, equals('s0:c123,c456'));
    });

    group('JSON', () {
      test('toJson produces correct JSON', () {
        final seLinux = SELinuxOptions()
          ..user = 'system_u'
          ..role = 'system_r'
          ..type = 'container_t'
          ..level = 's0:c123,c456';

        final json = seLinux.toJson();

        expect(
            json,
            equals({
              'user': 'system_u',
              'role': 'system_r',
              'type': 'container_t',
              'level': 's0:c123,c456',
            }));
      });

      test('fromJson creates correct instance', () {
        final json = {
          'user': 'system_u',
          'role': 'system_r',
          'type': 'container_t',
          'level': 's0:c123,c456',
        };

        final seLinux = SELinuxOptions.fromJson(json);

        expect(seLinux.user, equals('system_u'));
        expect(seLinux.role, equals('system_r'));
        expect(seLinux.type, equals('container_t'));
        expect(seLinux.level, equals('s0:c123,c456'));
      });

      test('toJson omits null values', () {
        final seLinux = SELinuxOptions()
          ..user = 'system_u'
          ..type = 'container_t';

        final json = seLinux.toJson();

        expect(
            json,
            equals({
              'user': 'system_u',
              'type': 'container_t',
            }));
        expect(json.containsKey('role'), isFalse);
        expect(json.containsKey('level'), isFalse);
      });

      test('fromJson handles partial JSON', () {
        final json = {
          'user': 'system_u',
          'type': 'container_t',
        };

        final seLinux = SELinuxOptions.fromJson(json);

        expect(seLinux.user, equals('system_u'));
        expect(seLinux.type, equals('container_t'));
        expect(seLinux.role, isNull);
        expect(seLinux.level, isNull);
      });
    });
  });
}

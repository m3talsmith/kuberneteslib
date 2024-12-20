import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/host_alias.dart';

void main() {
  group('HostAlias', () {
    test('can be instantiated', () {
      final hostAlias = HostAlias();
      expect(hostAlias, isNotNull);
    });

    test('can be instantiated with parameters', () {
      final hostAlias = HostAlias(
        ip: '10.0.0.10',
        hostnames: ['foo.local', 'bar.local'],
      );
      expect(hostAlias.ip, equals('10.0.0.10'));
      expect(hostAlias.hostnames, equals(['foo.local', 'bar.local']));
    });

    group('JSON', () {
      test('serialization works with all fields', () {
        final hostAlias = HostAlias(
          ip: '192.168.1.10',
          hostnames: ['example.local', 'test.local'],
        );

        expect(
            hostAlias.toJson(),
            equals({
              'ip': '192.168.1.10',
              'hostnames': ['example.local', 'test.local'],
            }));
      });

      test('serialization omits null fields', () {
        final hostAlias = HostAlias();
        expect(hostAlias.toJson(), equals({}));
      });

      test('deserialization works with all fields', () {
        final json = {
          'ip': '10.0.0.10',
          'hostnames': ['service.local', 'db.local'],
        };

        final hostAlias = HostAlias.fromJson(json);
        expect(hostAlias.ip, equals('10.0.0.10'));
        expect(hostAlias.hostnames, equals(['service.local', 'db.local']));
      });

      test('deserialization works with partial fields', () {
        final json = {
          'ip': '10.0.0.10',
        };

        final hostAlias = HostAlias.fromJson(json);
        expect(hostAlias.ip, equals('10.0.0.10'));
        expect(hostAlias.hostnames, isNull);
      });
    });
  });
}

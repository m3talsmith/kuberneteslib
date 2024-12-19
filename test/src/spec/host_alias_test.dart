import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/host_alias.dart';

void main() {
  group('HostAlias', () {
    test('can be instantiated with custom values', () {
      final hostAlias = HostAlias(
        ip: '192.168.1.1',
        hostnames: ['host1.local', 'host1'],
      );
      expect(hostAlias.ip, '192.168.1.1');
      expect(hostAlias.hostnames, ['host1.local', 'host1']);
    });

    group('JSON serialization', () {
      test('toJson() excludes null values', () {
        final hostAlias = HostAlias();
        final json = hostAlias.toJson();
        expect(json, isEmpty);
      });

      test('fromJson() deserializes correctly', () {
        final json = {
          'ip': '10.0.0.10',
          'hostnames': ['service.local', 'service'],
        };
        final hostAlias = HostAlias.fromJson(json);
        expect(hostAlias.ip, '10.0.0.10');
        expect(hostAlias.hostnames, ['service.local', 'service']);
      });

      test('toJson() serializes correctly', () {
        final hostAlias = HostAlias()
          ..ip = '10.0.0.10'
          ..hostnames = ['service.local', 'service'];

        final json = hostAlias.toJson();
        expect(json, {
          'ip': '10.0.0.10',
          'hostnames': ['service.local', 'service'],
        });
      });
    });
  });
}

import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/sysctl.dart';

void main() {
  group('Sysctl', () {
    test('can be instantiated', () {
      final sysctl = Sysctl(
        name: 'net.ipv4.tcp_keepalive_time',
        value: '600',
      );

      expect(sysctl.name, equals('net.ipv4.tcp_keepalive_time'));
      expect(sysctl.value, equals('600'));
    });

    test('can be created from JSON', () {
      final json = {
        'name': 'kernel.shm_rmid_forced',
        'value': '1',
      };

      final sysctl = Sysctl.fromJson(json);

      expect(sysctl.name, equals('kernel.shm_rmid_forced'));
      expect(sysctl.value, equals('1'));
    });

    test('can be converted to JSON', () {
      final sysctl = Sysctl(
        name: 'vm.swappiness',
        value: '60',
      );

      final json = sysctl.toJson();

      expect(
          json,
          equals({
            'name': 'vm.swappiness',
            'value': '60',
          }));
    });

    test('supports various sysctl parameter types', () {
      final sysctls = [
        Sysctl(name: 'kernel.shm_rmid_forced', value: '1'),
        Sysctl(name: 'net.ipv4.tcp_syncookies', value: '1'),
        Sysctl(name: 'vm.swappiness', value: '60'),
        Sysctl(name: 'net.core.somaxconn', value: '16384'),
      ];

      for (final sysctl in sysctls) {
        expect(sysctl.name, isNotEmpty);
        expect(sysctl.value, isNotEmpty);
      }
    });
  });
}

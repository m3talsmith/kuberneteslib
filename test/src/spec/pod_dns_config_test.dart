import 'package:kuberneteslib/src/spec/pod_dns_config.dart';
import 'package:kuberneteslib/src/spec/pod_dns_config_option.dart';
import 'package:test/test.dart';

void main() {
  group('PodDNSConfig', () {
    test('can be instantiated', () {
      final config = PodDNSConfig();
      expect(config, isNotNull);
    });

    test('can be created with nameservers', () {
      final config = PodDNSConfig()..nameservers = ['8.8.8.8', '8.8.4.4'];

      expect(config.nameservers, hasLength(2));
      expect(config.nameservers, contains('8.8.8.8'));
      expect(config.nameservers, contains('8.8.4.4'));
    });

    test('can be created with search domains', () {
      final config = PodDNSConfig()
        ..searches = ['ns1.svc.cluster.local', 'svc.cluster.local'];

      expect(config.searches, hasLength(2));
      expect(config.searches, contains('ns1.svc.cluster.local'));
      expect(config.searches, contains('svc.cluster.local'));
    });

    test('can be created with options', () {
      final config = PodDNSConfig()
        ..options = [
          PodDNSConfigOption()
            ..name = 'ndots'
            ..value = '5',
          PodDNSConfigOption()
            ..name = 'timeout'
            ..value = '2',
        ];

      expect(config.options, hasLength(2));
      expect(config.options?.first.name, equals('ndots'));
      expect(config.options?.first.value, equals('5'));
      expect(config.options?.last.name, equals('timeout'));
      expect(config.options?.last.value, equals('2'));
    });

    group('JSON serialization', () {
      test('toJson() creates correct JSON', () {
        final config = PodDNSConfig()
          ..nameservers = ['8.8.8.8', '8.8.4.4']
          ..searches = ['ns1.svc.cluster.local', 'svc.cluster.local']
          ..options = [
            PodDNSConfigOption()
              ..name = 'ndots'
              ..value = '5',
          ];

        final json = config.toJson();

        expect(json, {
          'nameservers': ['8.8.8.8', '8.8.4.4'],
          'searches': ['ns1.svc.cluster.local', 'svc.cluster.local'],
          'options': [
            {'name': 'ndots', 'value': '5'}
          ],
        });
      });

      test('fromJson() creates correct object', () {
        final json = {
          'nameservers': ['8.8.8.8', '8.8.4.4'],
          'searches': ['ns1.svc.cluster.local', 'svc.cluster.local'],
          'options': [
            {'name': 'ndots', 'value': '5'}
          ],
        };

        final config = PodDNSConfig.fromJson(json);

        expect(config.nameservers, ['8.8.8.8', '8.8.4.4']);
        expect(config.searches, ['ns1.svc.cluster.local', 'svc.cluster.local']);
        expect(config.options?.length, 1);
        expect(config.options?.first.name, 'ndots');
        expect(config.options?.first.value, '5');
      });

      test('empty fields are not included in JSON', () {
        final config = PodDNSConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });
    });
  });
}

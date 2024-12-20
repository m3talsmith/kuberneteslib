import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/pod_dns_config_option.dart';

void main() {
  group('PodDNSConfigOption', () {
    test('can be instantiated', () {
      final option = PodDNSConfigOption();
      expect(option, isNotNull);
    });

    test('supports value comparison', () {
      final option1 = PodDNSConfigOption()
        ..name = 'ndots'
        ..value = '5';

      final option2 = PodDNSConfigOption()
        ..name = 'ndots'
        ..value = '5';

      expect(option1.toJson(), equals(option2.toJson()));
    });

    group('fromJson', () {
      test('creates instance from valid JSON', () {
        final json = {
          'name': 'ndots',
          'value': '5',
        };

        final option = PodDNSConfigOption.fromJson(json);
        expect(option.name, equals('ndots'));
        expect(option.value, equals('5'));
      });

      test('handles null values', () {
        final json = <String, dynamic>{};

        final option = PodDNSConfigOption.fromJson(json);
        expect(option.name, isNull);
        expect(option.value, isNull);
      });
    });

    group('toJson', () {
      test('converts instance to JSON with all fields', () {
        final option = PodDNSConfigOption()
          ..name = 'timeout'
          ..value = '10';

        final json = option.toJson();
        expect(
            json,
            equals({
              'name': 'timeout',
              'value': '10',
            }));
      });

      test('omits null values in JSON', () {
        final option = PodDNSConfigOption()..name = 'timeout';

        final json = option.toJson();
        expect(
            json,
            equals({
              'name': 'timeout',
            }));
        expect(json.containsKey('value'), isFalse);
      });
    });

    group('common DNS options', () {
      test('ndots configuration', () {
        final option = PodDNSConfigOption()
          ..name = 'ndots'
          ..value = '2';

        expect(
            option.toJson(),
            equals({
              'name': 'ndots',
              'value': '2',
            }));
      });

      test('timeout configuration', () {
        final option = PodDNSConfigOption()
          ..name = 'timeout'
          ..value = '5';

        expect(
            option.toJson(),
            equals({
              'name': 'timeout',
              'value': '5',
            }));
      });

      test('attempts configuration', () {
        final option = PodDNSConfigOption()
          ..name = 'attempts'
          ..value = '3';

        expect(
            option.toJson(),
            equals({
              'name': 'attempts',
              'value': '3',
            }));
      });
    });
  });
}

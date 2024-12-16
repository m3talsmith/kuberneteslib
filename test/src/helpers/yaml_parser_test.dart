import 'package:test/test.dart';
import 'package:yaml/yaml.dart';
import 'package:kuberneteslib/src/helpers/yaml_parser.dart';

void main() {
  group('YAML Parser Tests', () {
    test('converts simple key-value pairs', () {
      final yamlString = '''
        name: John
        age: 30
        isStudent: true
      ''';

      final yaml = loadYaml(yamlString) as YamlMap;
      final result = fromYamlMap(yaml);

      expect(result, {
        'name': 'John',
        'age': 30,
        'isStudent': true,
      });
    });

    test('converts nested maps', () {
      final yamlString = '''
        person:
          name: John
          address:
            city: New York
            country: USA
      ''';

      final yaml = loadYaml(yamlString) as YamlMap;
      final result = fromYamlMap(yaml);

      expect(result, {
        'person': {
          'name': 'John',
          'address': {
            'city': 'New York',
            'country': 'USA',
          },
        },
      });
    });

    test('converts lists', () {
      final yamlString = '''
        fruits:
          - apple
          - banana
          - orange
      ''';

      final yaml = loadYaml(yamlString) as YamlMap;
      final result = fromYamlMap(yaml);

      expect(result, {
        'fruits': ['apple', 'banana', 'orange'],
      });
    });

    test('converts complex nested structure', () {
      final yamlString = '''
        users:
          - name: John
            hobbies:
              - reading
              - gaming
          - name: Jane
            hobbies:
              - painting
              - swimming
      ''';

      final yaml = loadYaml(yamlString) as YamlMap;
      final result = fromYamlMap(yaml);

      expect(result, {
        'users': [
          {
            'name': 'John',
            'hobbies': ['reading', 'gaming'],
          },
          {
            'name': 'Jane',
            'hobbies': ['painting', 'swimming'],
          },
        ],
      });
    });

    test('handles empty structures', () {
      final yamlString = '''
        emptyMap: {}
        emptyList: []
      ''';

      final yaml = loadYaml(yamlString) as YamlMap;
      final result = fromYamlMap(yaml);

      expect(result, {
        'emptyMap': {},
        'emptyList': [],
      });
    });
  });
}

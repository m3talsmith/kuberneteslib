import 'package:test/test.dart';
import 'package:kuberneteslib/src/cluster/config.dart';

void main() {
  group('Configs', () {
    late Configs configs;

    setUp(() {
      configs = Configs();
    });

    test('add and length', () {
      expect(configs.length, 0);
      configs.add(Config()..currentContext = 'test-context');
      expect(configs.length, 1);
    });

    test('first and last', () {
      final config1 = Config()..currentContext = 'context1';
      final config2 = Config()..currentContext = 'context2';
      
      configs.add(config1);
      configs.add(config2);
      
      expect(configs.first?.currentContext, 'context1');
      expect(configs.last?.currentContext, 'context2');
    });

    test('firstOrElse', () {
      final config = Config()..currentContext = 'test-context';
      configs.add(config);

      final found = configs.firstOrElse(
        (c) => c.currentContext == 'test-context',
        orElse: () => Config()..currentContext = 'default',
      );
      expect(found.currentContext, 'test-context');

      final notFound = configs.firstOrElse(
        (c) => c.currentContext == 'non-existent',
        orElse: () => Config()..currentContext = 'default',
      );
      expect(notFound.currentContext, 'default');
    });

    test('map and reduce', () {
      configs.add(Config()..currentContext = 'dev');
      configs.add(Config()..currentContext = 'prod');

      final contexts = configs.configs.map(
        (config) => config.currentContext,
      );
      expect(contexts, ['dev', 'prod']);

      final combined = configs.reduce<String>(
        '',
        (acc, config) => '$acc${config.currentContext},',
      );
      expect(combined, 'dev,prod,');
    });
  });

  group('Config', () {
    test('fromJson and toJson', () {
      final config = Config()
        ..apiVersion = 'v1'
        ..currentContext = 'test-context'
        ..clusters = []
        ..contexts = []
        ..users = []
        ..kind = 'Config'
        ..preferences = {'key': 'value'}
        ..displayName = 'Test Config';

      final json = config.toJson();
      final decoded = Config.fromJson(json);

      expect(decoded.apiVersion, 'v1');
      expect(decoded.currentContext, 'test-context');
      expect(decoded.kind, 'Config');
      expect(decoded.preferences?['key'], 'value');
      expect(decoded.displayName, 'Test Config');
    });

    test('fromYaml and toYaml', () {
      final yaml = '''
apiVersion: v1
currentContext: test-context
kind: Config
preferences:
  key: value
clusters: []
contexts: []
users: []
displayName: Test Config
''';

      final config = Config.fromYaml(yaml);
      expect(config?.apiVersion, 'v1');
      expect(config?.currentContext, 'test-context');
      expect(config?.preferences?['key'], 'value');
      expect(config?.displayName, 'Test Config');

      final regeneratedYaml = config?.toYaml();
      expect(regeneratedYaml, contains('apiVersion: v1'));
      expect(regeneratedYaml, contains('currentContext: test-context'));
      expect(regeneratedYaml, contains('key: value'));
      expect(regeneratedYaml, contains('displayName: Test Config'));
    });

    test('empty yaml returns null', () {
      expect(Config.fromYaml(''), null);
    });
  });
} 
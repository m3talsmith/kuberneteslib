import 'package:test/test.dart';
import 'package:kuberneteslib/src/cluster/cluster.dart';

void main() {
  group('Cluster', () {
    late Cluster cluster;

    setUp(() {
      cluster = Cluster(
        name: 'test-cluster',
        server: 'https://localhost:6443',
      );
    });

    test('creates instance with correct properties', () {
      expect(cluster.name, equals('test-cluster'));
      expect(cluster.server, equals('https://localhost:6443'));
    });

    test('throws ArgumentError when name is empty', () {
      expect(
        () => Cluster(name: '', server: 'https://localhost:6443'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('throws ArgumentError when server is invalid', () {
      expect(
        () => Cluster(name: 'test-cluster', server: 'invalid-url'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
} 
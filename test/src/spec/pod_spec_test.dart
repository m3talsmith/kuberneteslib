import 'package:kuberneteslib/src/spec/affinity.dart';
import 'package:kuberneteslib/src/spec/container.dart';
import 'package:kuberneteslib/src/spec/pod_dns_config.dart';
import 'package:kuberneteslib/src/spec/pod_security_context.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';
import 'package:kuberneteslib/src/spec/pod_spec.dart';
import 'package:test/test.dart';

void main() {
  group('PodSpec', () {
    test('creates PodSpec with basic container configuration', () {
      final podSpec = PodSpec(
        containers: [
          Container()
            ..name = 'test-container'
            ..image = 'nginx:latest'
        ],
      );

      final json = podSpec.toJson();
      expect(json['containers'], isNotNull);
      expect(json['containers'][0]['name'], equals('test-container'));
      expect(json['containers'][0]['image'], equals('nginx:latest'));
      expect(json['kind'], equals('pod'));
    });

    test('creates PodSpec with full configuration', () {
      final podSpec = PodSpec(
        containers: [
          Container()
            ..name = 'main'
            ..image = 'nginx:latest'
        ],
        dnsConfig: PodDNSConfig()..nameservers = ['8.8.8.8'],
        securityContext: PodSecurityContext()..runAsNonRoot = true,
        hostname: 'test-pod',
        priorityClassName: 'high-priority',
        terminationGracePeriodSeconds: 30,
      );

      final json = podSpec.toJson();
      expect(json['containers'], isNotNull);
      expect(json['dnsConfig']['nameservers'], contains('8.8.8.8'));
      expect(json['securityContext']['runAsNonRoot'], isTrue);
      expect(json['hostname'], equals('test-pod'));
      expect(json['priorityClassName'], equals('high-priority'));
      expect(json['terminationGracePeriodSeconds'], equals(30));
    });

    test('deserializes PodSpec from JSON correctly', () {
      final json = {
        'containers': [
          {
            'name': 'web',
            'image': 'nginx:1.14.2',
          }
        ],
        'dnsPolicy': 'ClusterFirst',
        'serviceAccountName': 'default',
        'restartPolicy': 'Always',
      };

      final podSpec = PodSpec.fromJson(json);
      expect(podSpec.containers?.length, equals(1));
      expect(podSpec.containers?[0].name, equals('web'));
      expect(podSpec.dnsPolicy, equals('ClusterFirst'));
      expect(podSpec.serviceAccountName, equals('default'));
    });

    test('handles null values correctly', () {
      final podSpec = PodSpec();
      final json = podSpec.toJson();

      expect(json.containsKey('containers'), isFalse);
      expect(json.containsKey('dnsConfig'), isFalse);
      expect(json.containsKey('securityContext'), isFalse);
    });

    test('handles complex node selector configuration', () {
      final podSpec = PodSpec(nodeSelector: {
        'kubernetes.io/os': 'linux',
        'disk': 'ssd',
        'cpu': 'high-performance'
      });

      final json = podSpec.toJson();
      expect(json['nodeSelector'], isNotNull);
      expect(json['nodeSelector']['kubernetes.io/os'], equals('linux'));
      expect(json['nodeSelector']['disk'], equals('ssd'));
      expect(json['nodeSelector']['cpu'], equals('high-performance'));
    });

    test('serializes and deserializes init containers', () {
      final podSpec = PodSpec(initContainers: [
        Container()
          ..name = 'init-db'
          ..image = 'busybox'
          ..command = ['sh', '-c', 'echo initializing']
      ]);

      final json = podSpec.toJson();
      final deserializedSpec = PodSpec.fromJson(json);

      expect(deserializedSpec.initContainers?.length, equals(1));
      expect(deserializedSpec.initContainers?[0].name, equals('init-db'));
      expect(deserializedSpec.initContainers?[0].image, equals('busybox'));
      expect(deserializedSpec.initContainers?[0].command,
          equals(['sh', '-c', 'echo initializing']));
    });

    test('handles image pull secrets configuration', () {
      final podSpec = PodSpec(imagePullSecrets: [
        LocalObjectReference()..name = 'registry-secret',
        LocalObjectReference()..name = 'docker-registry'
      ]);

      final json = podSpec.toJson();
      expect(json['imagePullSecrets'], hasLength(2));
      expect(json['imagePullSecrets'][0]['name'], equals('registry-secret'));
      expect(json['imagePullSecrets'][1]['name'], equals('docker-registry'));
    });

    test('handles affinity rules correctly', () {
      final json = {
        'affinity': {
          'nodeAffinity': {
            'requiredDuringSchedulingIgnoredDuringExecution': {
              'nodeSelectorTerms': [
                {
                  'matchExpressions': [
                    {
                      'key': 'kubernetes.io/e2e-az-name',
                      'operator': 'In',
                      'values': ['e2e-az1', 'e2e-az2']
                    }
                  ]
                }
              ]
            }
          }
        }
      };
      final deserializedSpec = PodSpec.fromJson(json);

      expect(deserializedSpec.affinity, isNotNull);
      final requirement = (deserializedSpec.affinity as NodeAffinity?)
          ?.requiredDuringSchedulingIgnoredDuringExecution
          ?.nodeSelectorTerms?[0]
          .matchExpressions?[0];

      expect(requirement?.key, equals('kubernetes.io/e2e-az-name'));
      expect(requirement?.operator, equals('In'));
      expect(requirement?.values, contains('e2e-az1'));
    });

    test('handles volume configuration', () {
      final json = {
        'volumes': [
          {
            'name': 'config-volume',
            'configMap': {'name': 'app-config'}
          }
        ]
      };
      final deserializedSpec = PodSpec.fromJson(json);

      expect(deserializedSpec.volumes?.length, equals(1));
      expect(deserializedSpec.volumes?[0].name, equals('config-volume'));
      expect(
          deserializedSpec.volumes?[0].configMap?.name, equals('app-config'));
    });
  });
}

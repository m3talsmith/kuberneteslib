import 'package:kuberneteslib/src/spec/node_selector.dart';
import 'package:kuberneteslib/src/spec/node_selector_requirement.dart';
import 'package:kuberneteslib/src/spec/node_selector_term.dart';
import 'package:kuberneteslib/src/spec/resource_requirements.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/pod_spec.dart';
import 'package:kuberneteslib/src/spec/container.dart';
import 'package:kuberneteslib/src/spec/container_port.dart';
import 'package:kuberneteslib/src/spec/pod_dns_config.dart';
import 'package:kuberneteslib/src/spec/pod_security_context.dart';
import 'package:kuberneteslib/src/spec/volume.dart';
import 'package:kuberneteslib/src/spec/affinity.dart';
import 'package:kuberneteslib/src/spec/pod_os.dart';

void main() {
  group('PodSpec', () {
    test('can be instantiated', () {
      final podSpec = PodSpec();
      expect(podSpec, isNotNull);
      expect(podSpec.kind, equals('pod'));
    });

    test('supports JSON serialization/deserialization', () {
      final podSpec = PodSpec(
        containers: [
          SpecContainer()
            ..name = 'web'
            ..image = 'nginx:1.14.2'
            ..ports = [
              ContainerPort()..containerPort = 80,
            ],
        ],
        dnsPolicy: 'ClusterFirst',
      );

      final json = podSpec.toJson();
      final deserializedPodSpec = PodSpec.fromJson(json);

      expect(deserializedPodSpec.containers?.length, equals(1));
      expect(deserializedPodSpec.containers?[0].name, equals('web'));
      expect(deserializedPodSpec.containers?[0].image, equals('nginx:1.14.2'));
      expect(deserializedPodSpec.dnsPolicy, equals('ClusterFirst'));
      expect(deserializedPodSpec.kind, equals('pod'));
    });

    test('handles null values correctly', () {
      final podSpec = PodSpec();
      final json = podSpec.toJson();

      expect(json.containsKey('containers'), isFalse);
      expect(json.containsKey('volumes'), isFalse);
      expect(json.containsKey('dnsConfig'), isFalse);
    });

    test('serializes complex nested objects', () {
      final podSpec = PodSpec()
        ..containers = [
          SpecContainer()
            ..name = 'app'
            ..image = 'my-app:latest'
        ]
        ..securityContext = (PodSecurityContext()
          ..runAsNonRoot = true
          ..runAsUser = 1000)
        ..dnsConfig = (PodDNSConfig()
          ..nameservers = ['8.8.8.8']
          ..searches = ['example.com']
          ..options = []);

      final json = podSpec.toJson();
      final deserialized = PodSpec.fromJson(json);

      expect(deserialized.securityContext?.runAsNonRoot, isTrue);
      expect(deserialized.securityContext?.runAsUser, equals(1000));
      expect(deserialized.dnsConfig?.nameservers, contains('8.8.8.8'));
      expect(deserialized.dnsConfig?.searches, contains('example.com'));
    });

    test('handles volumes correctly', () {
      final podSpec = PodSpec()
        ..volumes = [
          Volume()..name = 'data',
        ];

      final json = podSpec.toJson();
      final deserialized = PodSpec.fromJson(json);

      expect(deserialized.volumes?.length, equals(1));
      expect(deserialized.volumes?[0].name, equals('data'));
      expect(deserialized.volumes?[0].emptyDir, isNull);
    });

    test('handles affinity settings', () {
      final podSpec = PodSpec()
        ..affinity = (NodeAffinity()
          ..kind = AffinityKind.nodeAffinity
          ..requiredDuringSchedulingIgnoredDuringExecution = (NodeSelector()
            ..nodeSelectorTerms = [
              (NodeSelectorTerm()
                ..matchExpressions = [
                  (NodeSelectorRequirement()
                    ..key = 'kubernetes.io/os'
                    ..operator = 'In'
                    ..values = ['linux'])
                ])
            ]));

      final json = podSpec.toJson();
      final deserialized = PodSpec.fromJson(json);

      expect(deserialized.affinity, isNotNull);
    });

    test('handles OS specification', () {
      final podSpec = PodSpec()..os = (PodOS()..name = 'linux');

      final json = podSpec.toJson();
      final deserialized = PodSpec.fromJson(json);

      expect(deserialized.os?.name, equals('linux'));
    });

    test('handles resource requirements', () {
      final podSpec = PodSpec()
        ..containers = [
          SpecContainer()
            ..name = 'resource-test'
            ..resources = (ResourceRequirements()
              ..limits = {
                'cpu': '500m',
                'memory': '128Mi',
              }
              ..requests = {
                'cpu': '250m',
                'memory': '64Mi',
              })
        ];

      final json = podSpec.toJson();
      final deserialized = PodSpec.fromJson(json);

      expect(deserialized.containers?[0].resources?.limits?['cpu'],
          equals('500m'));
      expect(deserialized.containers?[0].resources?.requests?['memory'],
          equals('64Mi'));
    });
  });
}

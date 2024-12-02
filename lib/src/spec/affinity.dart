import 'node_selector.dart';
import 'pod_affinity_term.dart';
import 'preferred_scheduling_term.dart';
import 'weighted_pod_affinity_term.dart';

enum AffinityKind {
  nodeAffinity,
  podAffinity,
  podAntiAffinity,
  unknown;

  const AffinityKind();

  factory AffinityKind.fromString(String kind) {
    return AffinityKind.values.firstWhere(
      (e) => e.name == kind,
      orElse: () => AffinityKind.unknown,
    );
  }
}

/// Base class for Kubernetes affinity configurations.
///
/// Affinity rules control how pods are scheduled onto nodes in a Kubernetes cluster.
/// There are three types of affinity:
/// - Node affinity: Controls pod placement based on node labels
/// - Pod affinity: Attracts pods to nodes based on existing pod labels
/// - Pod anti-affinity: Repels pods from nodes based on existing pod labels
abstract class Affinity {
  /// Creates an Affinity instance from a JSON/YAML map representation.
  ///
  /// This is the base factory method that specific affinity types implement.
  static Affinity fromMap(Map<String, dynamic> data) {
    final kind = (data['kind'] != null)
        ? AffinityKind.fromString(data['kind'])
        : AffinityKind.unknown;
    switch (kind) {
      case AffinityKind.nodeAffinity:
        return NodeAffinity.fromMap(data);
      case AffinityKind.podAffinity:
        return PodAffinity.fromMap(data);
      case AffinityKind.podAntiAffinity:
        return PodAntiAffinity.fromMap(data);
      default:
        throw Exception('unknown affinity kind');
    }
  }

  Map<String, dynamic> toMap();
}

/// Represents node affinity configuration in Kubernetes
/// Used to constrain which nodes your pod can be scheduled on based on node labels
class NodeAffinity implements Affinity {
  /// Preferred node scheduling requirements that the scheduler will try to meet
  /// but will not guarantee
  late List<PreferredSchedulingTerm>
      preferredDuringSchedulingIgnoredDuringExecution;

  /// Required node scheduling requirements that must be met for pod scheduling
  late NodeSelector requiredDuringSchedulingIgnoredDuringExecution;

  /// Creates a NodeAffinity instance from a map representation
  NodeAffinity.fromMap(Map<String, dynamic> data) {
    preferredDuringSchedulingIgnoredDuringExecution =
        (data['preferredDuringSchedulingIgnoredDuringExecution']
                as List<Map<String, dynamic>>)
            .map(
              (e) => PreferredSchedulingTerm.fromMap(e),
            )
            .toList();
    requiredDuringSchedulingIgnoredDuringExecution = NodeSelector.fromMap(
        data['requiredDuringSchedulingIgnoredDuringExecution']);
  }

  @override
  Map<String, dynamic> toMap() => {
        'preferredDuringSchedulingIgnoredDuringExecution':
            preferredDuringSchedulingIgnoredDuringExecution.map(
          (e) => e.toMap(),
        ),
        'requiredDuringSchedulingIgnoredDuringExecution':
            requiredDuringSchedulingIgnoredDuringExecution.toMap(),
      };
}

/// Represents pod affinity configuration in Kubernetes
///
/// Pod affinity rules allow you to specify that certain pods should be scheduled
/// on the same nodes as pods that match specific label selectors. This is useful
/// for co-locating related pods, such as:
/// - Placing frontend pods close to their backend pods
/// - Ensuring redundant pods are spread across nodes
///
/// Example use case: Placing cache pods on the same node as the application pods
/// that use them to reduce latency.
class PodAffinity implements Affinity {
  /// Preferred pod scheduling requirements that the scheduler will try to meet
  /// but will not guarantee
  late List<WeightedPodAffinityTerm>
      preferredDuringSchedulingIgnoredDuringExecution;

  /// Required pod scheduling requirements that must be met for pod scheduling
  late List<PodAffinityTerm> requiredDuringSchedulingIgnoredDuringExecution;

  /// Creates a PodAffinity instance from a map representation
  PodAffinity.fromMap(Map<String, dynamic> data) {
    preferredDuringSchedulingIgnoredDuringExecution =
        (data['preferredDuringSchedulingIgnoredDuringExecution']
                as List<dynamic>)
            .map(
              (e) => WeightedPodAffinityTerm.fromMap(e),
            )
            .toList();
    requiredDuringSchedulingIgnoredDuringExecution =
        (data['requiredDuringSchedulingIgnoredDuringExecution']
                as List<dynamic>)
            .map(
              (e) => PodAffinityTerm.fromMap(e),
            )
            .toList();
  }

  @override
  Map<String, dynamic> toMap() => {
        'preferredDuringSchedulingIgnoredDuringExecution':
            preferredDuringSchedulingIgnoredDuringExecution.isNotEmpty
                ? preferredDuringSchedulingIgnoredDuringExecution.map(
                    (e) => e.toMap(),
                  )
                : null,
        'requiredDuringSchedulingIgnoredDuringExecution':
            requiredDuringSchedulingIgnoredDuringExecution.isNotEmpty
                ? requiredDuringSchedulingIgnoredDuringExecution.map(
                    (e) => e.toMap(),
                  )
                : null,
      }..removeWhere(
          (key, value) => value == null,
        );
}

/// Represents pod anti-affinity configuration in Kubernetes
///
/// Pod anti-affinity rules prevent pods from being scheduled on nodes that already
/// have pods matching specific label selectors. This is useful for:
/// - Spreading replicas across different nodes for high availability
/// - Preventing resource-intensive pods from being co-located
///
/// Example use case: Ensuring multiple replicas of a stateless application
/// are scheduled on different nodes to improve fault tolerance.
class PodAntiAffinity implements Affinity {
  /// Preferred pod anti-affinity scheduling requirements that the scheduler will try to meet
  /// but will not guarantee
  late List<WeightedPodAffinityTerm>
      preferredDuringSchedulingIgnoredDuringExecution;

  /// Required pod anti-affinity scheduling requirements that must be met for pod scheduling
  late List<PodAffinityTerm> requiredDuringSchedulingIgnoredDuringExecution;

  /// Creates a PodAntiAffinity instance from a map representation
  PodAntiAffinity.fromMap(Map<String, dynamic> data) {
    preferredDuringSchedulingIgnoredDuringExecution =
        (data['preferredDuringSchedulingIgnoredDuringExecution']
                as List<dynamic>)
            .map(
              (e) => WeightedPodAffinityTerm.fromMap(e),
            )
            .toList();
    requiredDuringSchedulingIgnoredDuringExecution =
        (data['requiredDuringSchedulingIgnoredDuringExecution']
                as List<dynamic>)
            .map(
              (e) => PodAffinityTerm.fromMap(e),
            )
            .toList();
  }

  @override
  Map<String, dynamic> toMap() => {
        'preferredDuringSchedulingIgnoredDuringExecution':
            preferredDuringSchedulingIgnoredDuringExecution.isNotEmpty
                ? preferredDuringSchedulingIgnoredDuringExecution.map(
                    (e) => e.toMap(),
                  )
                : null,
        'requiredDuringSchedulingIgnoredDuringExecution':
            requiredDuringSchedulingIgnoredDuringExecution.isNotEmpty
                ? requiredDuringSchedulingIgnoredDuringExecution.map(
                    (e) => e.toMap(),
                  )
                : null,
      }..removeWhere(
          (key, value) => value == null,
        );
}

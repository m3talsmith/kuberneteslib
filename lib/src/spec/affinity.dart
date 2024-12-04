import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'node_selector.dart';
import 'pod_affinity_term.dart';
import 'preferred_scheduling_term.dart';
import 'weighted_pod_affinity_term.dart';

part 'affinity.g.dart';

/// Represents affinity rules in Kubernetes for pod scheduling.
///
/// Affinity enables fine-grained control over pod placement in a cluster.
/// Key features include:
/// - Node selection based on labels
/// - Pod co-location preferences
/// - Pod anti-co-location rules
/// - Weighted preferences
/// - Required vs preferred rules
///
/// Example:
/// ```dart
/// final nodeAffinity = NodeAffinity()
///   ..requiredDuringSchedulingIgnoredDuringExecution = NodeSelector()
///     ..nodeSelectorTerms = [
///       NodeSelectorTerm()
///         ..matchExpressions = [
///           NodeSelectorRequirement()
///             ..key = 'kubernetes.io/e2e-az-name'
///             ..operator = 'In'
///             ..values = ['e2e-az1', 'e2e-az2']
///         ]
///     ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)
/// for more details about affinity rules.
@JsonEnum()
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

/// JSON converter for Affinity objects.
///
/// Handles serialization and deserialization of Affinity instances to/from JSON.
class AffinityConverter implements JsonConverter<Affinity, String> {
  const AffinityConverter();

  @override
  Affinity fromJson(String json) => Affinity.fromJson(jsonDecode(json));

  @override
  String toJson(Affinity object) => jsonEncode(object.toJson());
}

/// Base class for Kubernetes affinity configurations.
///
/// Affinity rules control how pods are scheduled onto nodes in a Kubernetes cluster.
/// There are three types of affinity:
/// - Node affinity: Controls pod placement based on node labels
/// - Pod affinity: Attracts pods to nodes based on existing pod labels
/// - Pod anti-affinity: Repels pods from nodes based on existing pod labels
///
/// Example:
/// ```dart
/// final affinity = Affinity(
///   kind: AffinityKind.nodeAffinity,
///   affinity: NodeAffinity()
///     ..requiredDuringSchedulingIgnoredDuringExecution = NodeSelector()
/// );
/// ```
class Affinity {
  Affinity({required this.kind, required this.affinity});

  AffinityKind? kind;
  Affinity? affinity;
  /// Creates an Affinity instance from a JSON/YAML map representation.
  ///
  /// This is the base factory method that specific affinity types implement.
  factory Affinity.fromJson(Map<String, dynamic> json) {
    final kind = (json['kind'] != null)
        ? AffinityKind.fromString(json['kind'])
        : AffinityKind.unknown;
    switch (kind) {
      case AffinityKind.nodeAffinity:
        return Affinity(kind: kind, affinity: NodeAffinity.fromJson(json));
      case AffinityKind.podAffinity:
        return Affinity(kind: kind, affinity: PodAffinity.fromJson(json));
      case AffinityKind.podAntiAffinity:
        return Affinity(kind: kind, affinity: PodAntiAffinity.fromJson(json));
      default:
        throw Exception('unknown affinity kind');
    }
  }

  Map<String, dynamic> toJson() => affinity?.toJson() ?? {};
}

/// Represents node affinity configuration in Kubernetes
/// Used to constrain which nodes your pod can be scheduled on based on node labels
@JsonSerializable()
class NodeAffinity implements Affinity {
  NodeAffinity()
      : preferredDuringSchedulingIgnoredDuringExecution = [],
        requiredDuringSchedulingIgnoredDuringExecution = NodeSelector();

  /// Preferred node scheduling requirements that the scheduler will try to meet
  /// but will not guarantee
  final List<PreferredSchedulingTerm> preferredDuringSchedulingIgnoredDuringExecution;

  /// Required node scheduling requirements that must be met for pod scheduling
  final NodeSelector requiredDuringSchedulingIgnoredDuringExecution;

  factory NodeAffinity.fromJson(Map<String, dynamic> json) =>
      _$NodeAffinityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NodeAffinityToJson(this);

  @override
  AffinityKind? kind;

  @override
  Affinity? affinity;
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
@JsonSerializable()
class PodAffinity implements Affinity {
  PodAffinity()
      : preferredDuringSchedulingIgnoredDuringExecution = [],
        requiredDuringSchedulingIgnoredDuringExecution = [];

  /// Preferred pod scheduling requirements that the scheduler will try to meet
  /// but will not guarantee
  List<WeightedPodAffinityTerm> preferredDuringSchedulingIgnoredDuringExecution;

  /// Required pod scheduling requirements that must be met for pod scheduling
  List<PodAffinityTerm> requiredDuringSchedulingIgnoredDuringExecution;

  factory PodAffinity.fromJson(Map<String, dynamic> json) =>
      _$PodAffinityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PodAffinityToJson(this);

  @override
  AffinityKind? kind;

  @override
  Affinity? affinity;
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
@JsonSerializable()
class PodAntiAffinity implements Affinity {
  PodAntiAffinity();
  /// Preferred pod anti-affinity scheduling requirements that the scheduler will try to meet
  /// but will not guarantee
  late List<WeightedPodAffinityTerm>
      preferredDuringSchedulingIgnoredDuringExecution;

  /// Required pod anti-affinity scheduling requirements that must be met for pod scheduling
  late List<PodAffinityTerm> requiredDuringSchedulingIgnoredDuringExecution;

  factory PodAntiAffinity.fromJson(Map<String, dynamic> json) =>
      _$PodAntiAffinityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PodAntiAffinityToJson(this);

  @override
  AffinityKind? kind;

  @override
  Affinity? affinity;
}


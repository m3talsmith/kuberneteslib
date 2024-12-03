import 'package:json_annotation/json_annotation.dart';

import 'label_selector.dart';

part 'pod_affinity_term.g.dart';

/// Represents a pod affinity term in Kubernetes.
///
/// PodAffinityTerm defines rules for pod placement based on the location of other pods.
/// Key features include:
/// - Label-based pod selection
/// - Namespace filtering
/// - Topology domain awareness
/// - Cross-namespace scheduling
///
/// Common use cases:
/// - Co-locating related pods
/// - Spreading across failure domains
/// - Service proximity rules
/// - Multi-tenant isolation
///
/// Example:
/// ```dart
/// final term = PodAffinityTerm()
///   ..labelSelector = (LabelSelector()
///     ..matchLabels = {'app': 'cache'})
///   ..topologyKey = 'kubernetes.io/hostname'
///   ..namespaces = ['prod']
///   ..namespaceSelector = (LabelSelector()
///     ..matchLabels = {'environment': 'production'});
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity)
/// for more details about pod affinity.
@JsonSerializable()
class PodAffinityTerm {
  PodAffinityTerm(): labelSelector = LabelSelector(), namespaceSelector = LabelSelector(), namespaces = [], topologyKey = '';
  /// Label selector for identifying target pods.
  /// 
  /// Defines which pods this affinity term applies to based on their labels.
  /// Must match for the affinity rule to take effect.
  final LabelSelector labelSelector;

  /// Label selector for filtering namespaces to search in.
  /// 
  /// When specified, only namespaces matching these labels will be considered
  /// when looking for matching pods. Works in conjunction with [namespaces].
  final LabelSelector namespaceSelector;

  /// List of specific namespaces to search for matching pods.
  /// 
  /// When specified, only these namespaces will be considered.
  /// If empty and namespaceSelector is null, defaults to the pod's namespace.
  final List<String> namespaces;

  /// The node topology key used for pod distribution.
  /// 
  /// Pods matching the affinity rules will be scheduled relative to each other
  /// based on this topology domain. Common values:
  /// - kubernetes.io/hostname
  /// - topology.kubernetes.io/zone
  /// - topology.kubernetes.io/region
  final String topologyKey;
  
  factory PodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$PodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$PodAffinityTermToJson(this);
}

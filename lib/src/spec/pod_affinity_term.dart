import 'package:json_annotation/json_annotation.dart';

import 'label_selector.dart';

part 'pod_affinity_term.g.dart';

Map<String, dynamic>? _labelSelectorToJson(LabelSelector? instance) =>
    instance?.toJson();

LabelSelector? _labelSelectorFromJson(Map<String, dynamic>? json) =>
    json == null ? null : LabelSelector.fromJson(json);

List<String>? _namespacesFromJson(List<dynamic>? json) =>
    json?.map((e) => e as String).toList();

List<dynamic>? _namespacesToJson(List<String>? instance) => instance?.toList();

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
  PodAffinityTerm({
    this.labelSelector,
    this.namespaceSelector,
    this.namespaces,
    this.topologyKey,
  });

  /// Label selector for identifying target pods.
  ///
  /// Defines which pods this affinity term applies to based on their labels.
  /// Must match for the affinity rule to take effect.
  @JsonKey(
      includeIfNull: false,
      fromJson: _labelSelectorFromJson,
      toJson: _labelSelectorToJson)
  LabelSelector? labelSelector;

  /// Label selector for filtering namespaces to search in.
  ///
  /// When specified, only namespaces matching these labels will be considered
  /// when looking for matching pods. Works in conjunction with [namespaces].
  @JsonKey(
      includeIfNull: false,
      fromJson: _labelSelectorFromJson,
      toJson: _labelSelectorToJson)
  LabelSelector? namespaceSelector;

  /// List of specific namespaces to search for matching pods.
  ///
  /// When specified, only these namespaces will be considered.
  /// If empty and namespaceSelector is null, defaults to the pod's namespace.
  @JsonKey(
      includeIfNull: false,
      fromJson: _namespacesFromJson,
      toJson: _namespacesToJson)
  List<String>? namespaces;

  /// The node topology key used for pod distribution.
  ///
  /// Pods matching the affinity rules will be scheduled relative to each other
  /// based on this topology domain. Common values:
  /// - kubernetes.io/hostname
  /// - topology.kubernetes.io/zone
  /// - topology.kubernetes.io/region
  @JsonKey(includeIfNull: false)
  String? topologyKey;

  factory PodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$PodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$PodAffinityTermToJson(this);
}

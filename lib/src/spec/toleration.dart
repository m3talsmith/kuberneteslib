import 'package:json_annotation/json_annotation.dart';

part 'toleration.g.dart';

/// Represents a pod's toleration of node taints in Kubernetes.
///
/// Tolerations enable pods to be scheduled onto nodes with matching taints,
/// providing fine-grained control over pod placement. Key features include:
/// - Taint effect handling
/// - Key-value matching
/// - Execution time control
/// - Flexible operator support
///
/// Common use cases:
/// - Node dedication
/// - Special hardware access
/// - Zone-based scheduling
/// - Maintenance handling
///
/// Example:
/// ```dart
/// final toleration = Toleration()
///   ..key = 'node-role.kubernetes.io/master'
///   ..operator = 'Exists'
///   ..effect = 'NoSchedule';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)
/// for more details about taints and tolerations.
@JsonSerializable()
class Toleration {
  Toleration();

  /// The taint effect to match.
  ///
  /// Values:
  /// - 'NoSchedule': Prevents scheduling of new pods
  /// - 'PreferNoSchedule': Tries to avoid scheduling new pods
  /// - 'NoExecute': Evicts existing pods that don't tolerate the taint
  @JsonKey(includeIfNull: false)
  String? effect;

  /// The taint key that this toleration matches.
  ///
  /// Examples: 'node-role.kubernetes.io/master', 'dedicated', 'gpu'
  @JsonKey(includeIfNull: false)
  String? key;

  /// The operator that relates the key to the value.
  ///
  /// Values:
  /// - 'Exists': Key must exist (value ignored)
  /// - 'Equal': Key and value must match exactly
  @JsonKey(includeIfNull: false)
  String? operator;

  /// Duration in seconds the pod can run on a node with matching NoExecute taint.
  ///
  /// Only applies when effect is 'NoExecute'.
  /// After this time, pod will be evicted.
  @JsonKey(includeIfNull: false)
  int? tolerationSeconds;

  /// The taint value to match.
  ///
  /// Required if operator is 'Equal'.
  /// Ignored if operator is 'Exists'.
  @JsonKey(includeIfNull: false)
  String? value;

  factory Toleration.fromJson(Map<String, dynamic> json) =>
      _$TolerationFromJson(json);

  Map<String, dynamic> toJson() => _$TolerationToJson(this);
}

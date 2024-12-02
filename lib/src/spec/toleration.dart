/// A class representing a toleration in Kubernetes, which allows pods to be scheduled
/// onto nodes with matching taints.
class Toleration {
  /// The taint effect to tolerate. Possible values are: 'NoSchedule',
  /// 'PreferNoSchedule', and 'NoExecute'.
  String? effect;

  /// The taint key that the toleration applies to.
  String? key;

  /// The operator that relates the key to the value.
  /// Possible values are: 'Exists' and 'Equal'.
  String? operator;

  /// Indicates how long the pod should stay bound to a node that has a matching taint
  /// being tolerated. Only applies when effect is 'NoExecute'.
  /// Specified in seconds.
  int? tolerationSeconds;

  /// The taint value the toleration matches to.
  /// Not required if operator is 'Exists'.
  String? value;

  /// Creates a new [Toleration] instance from a Map.
  ///
  /// The [data] parameter should contain the following keys:
  /// - 'effect': The taint effect to tolerate
  /// - 'key': The taint key
  /// - 'operator': The operator relating key and value
  /// - 'tolerationSeconds': Duration in seconds for NoExecute effect
  /// - 'value': The taint value
  Toleration.fromMap(Map<String, dynamic> data) {
    effect = data['effect'];
    key = data['key'];
    operator = data['operator'];
    tolerationSeconds = data['tolerationSeconds'];
    value = data['value'];
  }

  Map<String, dynamic> toMap() => {
        'effect': effect,
        'key': key,
        'operator': operator,
        'tolerationSeconds': tolerationSeconds,
        'value': value,
      }..removeWhere(
          (key, value) => value == null,
        );
}

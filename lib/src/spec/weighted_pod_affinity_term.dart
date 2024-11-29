/// Provides access to the [PodAffinityTerm] class which defines pod affinity scheduling rules.
///
/// This import is used by [WeightedPodAffinityTerm] to specify pod affinity rules
/// with associated weights for pod scheduling decisions.
import 'pod_affinity_term.dart';

class WeightedPodAffinityTerm {
  late PodAffinityTerm podAffinityTerm;
  late int weight;

  /// A weighted pod affinity term for pod scheduling rules.
  ///
  /// Combines a pod affinity term with a weight to influence pod scheduling decisions.
  /// The weight field is used to compute the sum of weights of all of the matched 
  /// pod affinity terms, which is then used to prioritize node selection.
  ///
  /// Example:
  /// ```dart
  /// var term = WeightedPodAffinityTerm.fromMap({
  ///   'podAffinityTerm': {
  ///     'labelSelector': {'matchLabels': {'app': 'web'}},
  ///     'topologyKey': 'kubernetes.io/hostname'
  ///   },
  ///   'weight': 100
  /// });
  /// ```
  ///
  /// Fields:
  /// - [podAffinityTerm]: The pod affinity term that defines the scheduling rule
  /// - [weight]: The weight (1-100) associated with matching this term

  WeightedPodAffinityTerm.fromMap(Map<String, dynamic> data) {
    podAffinityTerm = PodAffinityTerm.fromMap(data['podAffinityTerm']);
    weight = data['weight'];
  }
}

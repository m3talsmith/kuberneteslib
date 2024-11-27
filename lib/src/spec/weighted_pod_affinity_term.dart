import 'pod_affinity_term.dart';

class WeightedPodAffinityTerm {
  late PodAffinityTerm podAffinityTerm;
  late int weight;

  WeightedPodAffinityTerm.fromMap(Map<String, dynamic> data) {
    podAffinityTerm = PodAffinityTerm.fromMap(data['podAffinityTerm']);
    weight = data['weight'];
  }
}

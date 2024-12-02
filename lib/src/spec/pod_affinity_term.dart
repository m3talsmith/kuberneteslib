import 'label_selector.dart';

/// Defines a pod affinity term, used to specify rules for pod placement
/// in relation to other pods in the Kubernetes cluster.
class PodAffinityTerm {
  /// A label query over a set of resources that the pod should match.
  late LabelSelector labelSelector;

  /// A label selector used to identify the namespaces to search for pods.
  late LabelSelector namespaceSelector;

  /// List of namespace names to which this pod affinity term applies.
  late List<String> namespaces;

  /// The key of node labels that the system uses to denote topology domains.
  /// Pods that match the affinity rules will be scheduled onto nodes that
  /// share the same topology key value.
  late String topologyKey;

  /// Creates a [PodAffinityTerm] from a map structure.
  ///
  /// The [data] parameter should contain the following keys:
  /// - 'labelSelector': Map defining the label selector
  /// - 'namespaceSelector': Map defining the namespace selector
  /// - 'namespaces': List of namespace strings
  /// - 'topologyKey': String representing the topology key
  PodAffinityTerm.fromMap(Map<String, dynamic> data) {
    labelSelector = LabelSelector.fromMap(data['labelSelector']);
    namespaceSelector = LabelSelector.fromMap(data['namespaceSelector']);
    namespaces = data['namespaces'] as List<String>;
    topologyKey = data['topologyKey'];
  }

  Map<String, dynamic> toMap() => {
        'labelSelector': labelSelector.toMap(),
        'namespaceSelector': namespaceSelector.toMap(),
        'namespaces': namespaces.isNotEmpty ? namespaces : null,
        'topologyKey': topologyKey.isNotEmpty ? topologyKey : null,
      };
}

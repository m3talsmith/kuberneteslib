import 'label_selector.dart';

/// Represents a topology spread constraint in Kubernetes, which controls how pods are
/// spread across your cluster among failure-domains such as regions, zones, nodes, etc.
class TopologySpreadConstraint {
  /// Label selector used to find matching pods.
  late LabelSelector labelSelector;

  /// A list of pod label keys to select the pods over which spreading will be calculated.
  late List<String> matchLabelKeys;

  /// The maximum difference between the number of matching pods in any two topology domains.
  late int maxSkew;

  /// The minimum number of topology domains that the pods should be spread over.
  late int minDomains;

  /// Indicates how we will treat Pod's nodeAffinity/nodeSelector when calculating
  /// pod topology spread skew.
  late String nodeAffinityPolicy;

  /// Indicates how we will treat node taints when calculating pod topology spread skew.
  late String nodeTaintsPolicy;

  /// The key of node labels that the system uses to denote the topology domain.
  late String topologyKey;

  /// Indicates how to deal with a pod if it doesn't satisfy the spread constraint.
  /// Can be "DoNotSchedule" or "ScheduleAnyway".
  late String whenUnsatisfiable;

  /// Creates a [TopologySpreadConstraint] from a map of values.
  /// 
  /// The map should contain all the necessary fields to populate the constraint's properties.
  TopologySpreadConstraint.fromMap(Map<String, dynamic> data) {
    labelSelector = LabelSelector.fromMap(data['labelSelector']);
    matchLabelKeys = data['matchLabelKeys'] as List<String>;
    maxSkew = data['maxSkew'];
    minDomains = data['minDomains'];
    nodeAffinityPolicy = data['nodeAffinityPolicy'];
    nodeTaintsPolicy = data['nodeTaintsPolicy'];
    topologyKey = data['topologyKey'];
    whenUnsatisfiable = data['whenUnsatisfiable'];
  }
}

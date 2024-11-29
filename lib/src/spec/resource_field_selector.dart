import 'quantity.dart';

/// A selector for resource fields that can be used to extract resource values
/// from containers in Kubernetes.
class ResourceFieldSelector {
  /// The name of the container to extract the resource from.
  String? containerName;

  /// The divisor to be used when calculating the resource value.
  /// Can be either a String or a Quantity.
  dynamic divisor;

  /// The name of the resource to extract (e.g., 'cpu', 'memory').
  String? resource;

  /// Creates a [ResourceFieldSelector] from a map representation.
  /// 
  /// The [data] map should contain the following keys:
  /// - 'containerName': String identifying the container
  /// - 'divisor': Either a String or Quantity value used for calculations
  /// - 'resource': String identifying the resource to select
  ResourceFieldSelector.fromMap(Map<String, dynamic> data) {
    containerName = data['containerName'];
    divisor = (data['divisor'] is String?)
        ? data['divisor']
        : data['divisor'] as Quantity?;
    resource = data['resource'];
  }
}

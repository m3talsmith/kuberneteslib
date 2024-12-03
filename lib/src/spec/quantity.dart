import 'package:json_annotation/json_annotation.dart';

part 'quantity.g.dart';

/// Represents a resource quantity in Kubernetes.
///
/// Quantity is used to express resource amounts like CPU, memory, and storage.
/// Key features include:
/// - Resource measurements
/// - Allocation limits
/// - Request specifications
/// - Quota management
///
/// Common use cases:
/// - Container resource limits
/// - Storage requests
/// - CPU allocation
/// - Memory constraints
///
/// Example:
/// ```dart
/// final cpuLimit = Quantity(0.5);  // 500m CPU
/// final memoryRequest = Quantity(256.0);  // 256Mi memory
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
/// for more details about resource quantities.
@JsonSerializable()
class Quantity {
  /// Creates a new Quantity instance with the specified value.
  /// 
  /// The value represents the resource amount in its base unit:
  /// - CPU: cores (0.1 = 100m)
  /// - Memory: bytes (1.0 = 1 byte)
  /// - Storage: bytes (1.0 = 1 byte)
  Quantity(this.value);

  /// The numerical value of the quantity.
  /// 
  /// This value is used in resource specifications to define
  /// limits, requests, and quotas for container resources.
  @JsonKey(includeIfNull: false)
  final double value;

  factory Quantity.fromJson(Map<String, dynamic> json) => _$QuantityFromJson(json);
  Map<String, dynamic> toJson() => _$QuantityToJson(this);
}

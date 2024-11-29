import '../meta/object_meta.dart';
import 'persistent_volume_claim_spec.dart';

/// Represents a template for creating a PersistentVolumeClaim.
/// 
/// This template is commonly used in StatefulSet specifications to define storage
/// requirements for each pod in the set.
class PersistentVolumeClaimTemplate {
  /// The metadata for the PersistentVolumeClaim template.
  /// 
  /// Contains information like name, namespace, labels, and annotations.
  late ObjectMeta metadata;

  /// The specification for the PersistentVolumeClaim.
  /// 
  /// Defines the desired characteristics of the claim, such as storage size
  /// and access modes.
  late PersistentVolumeClaimSpec spec;

  /// Creates a new [PersistentVolumeClaimTemplate] instance from a map structure.
  /// 
  /// [data] should contain 'metadata' and 'spec' keys with their respective
  /// nested data structures.
  PersistentVolumeClaimTemplate.fromMap(Map<String, dynamic> data) {
    metadata = ObjectMeta.fromMap(data['metadata']);
    spec = PersistentVolumeClaimSpec.fromMap(data['spec']);
  }
}

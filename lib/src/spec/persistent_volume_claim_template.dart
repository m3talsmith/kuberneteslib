import 'package:json_annotation/json_annotation.dart';

import '../meta/object_meta.dart';
import 'persistent_volume_claim_spec.dart';

part 'persistent_volume_claim_template.g.dart';

Map<String, dynamic>? _metadataToJson(ObjectMeta? metadata) =>
    metadata?.toJson();

ObjectMeta? _metadataFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ObjectMeta.fromJson(json);

/// Represents a PersistentVolumeClaim template in Kubernetes.
///
/// PersistentVolumeClaimTemplate is used to dynamically create PVCs, typically
/// in StatefulSet workloads. Key features include:
/// - Dynamic PVC creation
/// - Per-pod storage allocation
/// - Consistent storage naming
/// - StatefulSet integration
///
/// Common use cases:
/// - Database per pod storage
/// - Distributed storage systems
/// - Stateful application scaling
/// - Data persistence across pod restarts
///
/// Example:
/// ```dart
/// final template = PersistentVolumeClaimTemplate()
///   ..metadata = (ObjectMeta()
///     ..name = 'data'
///     ..labels = {'app': 'database'})
///   ..spec = (PersistentVolumeClaimSpec()
///     ..accessModes = ['ReadWriteOnce']
///     ..resources = (ResourceRequirements()
///       ..requests = {'storage': '10Gi'})
///     ..storageClassName = 'standard');
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#stable-storage)
/// for more details about PVC templates in StatefulSets.
@JsonSerializable()
class PersistentVolumeClaimTemplate {
  /// Metadata for the PVC template.
  /// 
  /// Defines the base metadata for each PVC created from this template.
  /// StatefulSet will append a unique identifier to the name for each pod.
  /// Example: If template name is "data" and StatefulSet name is "mysql",
  /// PVCs will be named "data-mysql-0", "data-mysql-1", etc.
  @JsonKey(includeIfNull: false, toJson: _metadataToJson, fromJson: _metadataFromJson)
  ObjectMeta? metadata;

  /// Specification for the PVCs created from this template.
  /// 
  /// Defines the characteristics that each PVC should have, including:
  /// - Storage size and class
  /// - Access modes
  /// - Volume mode
  /// - Selector criteria
  @JsonKey(includeIfNull: false, toJson: _specToJson, fromJson: _specFromJson)
  PersistentVolumeClaimSpec? spec;

  PersistentVolumeClaimTemplate()
      : metadata = ObjectMeta(),
        spec = PersistentVolumeClaimSpec();

  factory PersistentVolumeClaimTemplate.fromJson(Map<String, dynamic> json) =>
      _$PersistentVolumeClaimTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$PersistentVolumeClaimTemplateToJson(this);
}

Map<String, dynamic>? _specToJson(PersistentVolumeClaimSpec? spec) => spec?.toJson();
PersistentVolumeClaimSpec? _specFromJson(Map<String, dynamic>? json) => json == null ? null : PersistentVolumeClaimSpec.fromJson(json);
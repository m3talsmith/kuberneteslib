import 'package:json_annotation/json_annotation.dart';

import 'label_selector.dart';
import 'resource_requirements.dart';
import 'typed_local_object_reference.dart';
import 'typed_object_reference.dart';

part 'persistent_volume_claim_spec.g.dart';

Map<String, dynamic>? _dataSourceToJson(TypedLocalObjectReference? ref) =>
    ref?.toJson();

TypedLocalObjectReference? _dataSourceFromJson(Map<String, dynamic>? json) =>
    json == null ? null : TypedLocalObjectReference.fromJson(json);

Map<String, dynamic>? _dataSourceRefToJson(TypedObjectReference? ref) =>
    ref?.toJson();

TypedObjectReference? _dataSourceRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : TypedObjectReference.fromJson(json);

Map<String, dynamic>? _resourcesToJson(ResourceRequirements? resources) =>
    resources?.toJson();

ResourceRequirements? _resourcesFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ResourceRequirements.fromJson(json);

Map<String, dynamic>? _selectorToJson(LabelSelector? selector) =>
    selector?.toJson();

LabelSelector? _selectorFromJson(Map<String, dynamic>? json) =>
    json == null ? null : LabelSelector.fromJson(json);

/// Represents a PersistentVolumeClaim (PVC) specification in Kubernetes.
///
/// PersistentVolumeClaimSpec defines the desired characteristics of a volume
/// that a pod can mount. Key features include:
/// - Access mode configuration
/// - Storage capacity requests
/// - Volume selection criteria
/// - Storage class specification
///
/// Common use cases:
/// - Database storage
/// - Shared file systems
/// - Application data persistence
/// - Stateful workload storage
///
/// Example:
/// ```dart
/// final pvcSpec = PersistentVolumeClaimSpec()
///   ..accessModes = ['ReadWriteOnce']
///   ..resources = (ResourceRequirements()
///     ..requests = {'storage': '10Gi'})
///   ..storageClassName = 'standard';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
/// for more details about persistent volume claims.
@JsonSerializable()
class PersistentVolumeClaimSpec {
  PersistentVolumeClaimSpec({
    this.accessModes,
    this.dataSource,
    this.dataSourceRef,
    this.resources,
    this.selector,
    this.storageClassName,
    this.volumeMode,
    this.volumeName,
  });

  /// List of desired access modes for the volume.
  ///
  /// Values:
  /// - `ReadWriteOnce` (RWO): Volume can be mounted as read-write by a single node
  /// - `ReadOnlyMany` (ROX): Volume can be mounted as read-only by many nodes
  /// - `ReadWriteMany` (RWX): Volume can be mounted as read-write by many nodes
  /// - `ReadWriteOncePod` (RWOP): Volume can be mounted as read-write by a single pod
  @JsonKey(includeIfNull: false)
  List<String>? accessModes;

  /// Reference to a volume snapshot or other data source in the same namespace.
  ///
  /// Used for pre-populating the PVC with data from another source.
  /// Only one of dataSource or dataSourceRef can be specified.
  @JsonKey(
      includeIfNull: false,
      toJson: _dataSourceToJson,
      fromJson: _dataSourceFromJson)
  TypedLocalObjectReference? dataSource;

  /// Reference to a volume snapshot or other data source, potentially in another namespace.
  ///
  /// Similar to dataSource but allows cross-namespace references.
  /// Only one of dataSource or dataSourceRef can be specified.
  @JsonKey(
      includeIfNull: false,
      toJson: _dataSourceRefToJson,
      fromJson: _dataSourceRefFromJson)
  TypedObjectReference? dataSourceRef;

  /// Resource requirements for the persistent volume claim.
  ///
  /// Typically specifies storage size requirements using the 'requests' field.
  /// Example: {'storage': '10Gi'}
  @JsonKey(
      includeIfNull: false,
      toJson: _resourcesToJson,
      fromJson: _resourcesFromJson)
  ResourceRequirements? resources;

  /// Label selector to filter potential persistent volumes.
  ///
  /// Used to bind to specific PVs based on their labels.
  /// If specified, only volumes matching the selector can be bound.
  @JsonKey(
      includeIfNull: false,
      toJson: _selectorToJson,
      fromJson: _selectorFromJson)
  LabelSelector? selector;

  /// Name of the desired StorageClass for this claim.
  ///
  /// The StorageClass determines the provisioning behavior and type of storage.
  /// Use empty string for immediate volume binding, or null to use the default class.
  @JsonKey(includeIfNull: false)
  String? storageClassName;

  /// Defines how the volume should be formatted and mounted.
  ///
  /// Values:
  /// - `Filesystem`: Traditional filesystem-based storage (default)
  /// - `Block`: Raw block device without a filesystem
  @JsonKey(includeIfNull: false)
  String? volumeMode;

  /// Name of a specific PersistentVolume to bind to.
  ///
  /// If specified, binds exclusively to the named volume.
  /// Volume must exist and match other requirements (size, access modes, etc.).
  @JsonKey(includeIfNull: false)
  String? volumeName;

  factory PersistentVolumeClaimSpec.fromJson(Map<String, dynamic> json) =>
      _$PersistentVolumeClaimSpecFromJson(json);

  Map<String, dynamic> toJson() => _$PersistentVolumeClaimSpecToJson(this);
}

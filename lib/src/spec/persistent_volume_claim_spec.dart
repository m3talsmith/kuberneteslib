import 'label_selector.dart';
import 'resource_requirements.dart';
import 'typed_local_object_reference.dart';
import 'typed_object_reference.dart';

/// Represents the specification of a Persistent Volume Claim in Kubernetes.
/// 
/// A PersistentVolumeClaim (PVC) is a request for storage by a user that can be fulfilled
/// by a PersistentVolume. This specification defines the desired characteristics of the claim.
class PersistentVolumeClaimSpec {
  /// List of access modes the volume should support.
  /// 
  /// Common values include:
  /// * ReadWriteOnce (RWO) - can be mounted as read-write by a single node
  /// * ReadOnlyMany (ROX) - can be mounted read-only by many nodes
  /// * ReadWriteMany (RWX) - can be mounted as read-write by many nodes
  late List<String> accessModes;

  /// Local volume data source reference.
  /// 
  /// Defines a reference to a resource in the same namespace that contains the data
  /// to be restored.
  late TypedLocalObjectReference dataSource;

  /// Reference to the volume data source.
  /// 
  /// Similar to dataSource but can reference resources in other namespaces.
  late TypedObjectReference dataSourceRef;

  /// Resource requirements for the claim.
  /// 
  /// Specifies the minimum resources the volume should have, such as storage size.
  late ResourceRequirements resources;

  /// Label selector for volume selection.
  /// 
  /// Used to filter the set of volumes that can be bound to this claim.
  late LabelSelector selector;

  /// Name of the StorageClass required by the claim.
  /// 
  /// The StorageClass will determine what type of volume is provisioned.
  late String storageClassName;

  /// The volume mode describes how a volume is intended to be consumed.
  /// 
  /// Values can be "Filesystem" or "Block".
  late String volumeMode;

  /// Name of the specific volume to bind to.
  /// 
  /// If specified, this volume will be bound to this claim.
  late String volumeName;

  /// Creates a new PersistentVolumeClaimSpec from a map structure.
  /// 
  /// [data] should contain all the necessary fields to populate the spec.
  PersistentVolumeClaimSpec.fromMap(Map<String, dynamic> data) {
    accessModes = data['accessModes'] as List<String>;
    dataSource = TypedLocalObjectReference.fromMap(data['dataSource']);
    dataSourceRef = TypedObjectReference.fromMap(data['dataSourceRef']);
    resources = ResourceRequirements.fromMap(data['resources']);
    selector = LabelSelector.fromMap(data['selector']);
    volumeMode = data['volumeMode'];
    volumeName = data['volumeName'];
  }
}

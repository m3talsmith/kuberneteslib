import 'package:json_annotation/json_annotation.dart';

part 'azure_file_volume_source.g.dart';

/// Represents an Azure File Service share that can be mounted as a volume in Kubernetes.
///
/// AzureFileVolumeSource enables pods to use Microsoft Azure File Service shares for
/// persistent storage. Key features include:
/// - SMB protocol support
/// - Cross-platform file sharing
/// - Concurrent access support
///
/// Common use cases:
/// - Shared configuration files
/// - Content management systems
/// - Legacy applications requiring file shares
///
/// Example:
/// ```dart
/// final azureFile = AzureFileVolumeSource()
///   ..shareName = 'my-share'
///   ..secretName = 'azure-storage-creds'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#azurefile)
/// for more details about Azure File volumes.
@JsonSerializable()
class AzureFileVolumeSource {
  AzureFileVolumeSource();

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  late bool readOnly;

  /// Name of the Secret containing Azure storage credentials.
  /// 
  /// The secret must contain 'azurestorageaccountname' and
  /// 'azurestorageaccountkey' fields.
  late String secretName;

  /// Name of the Azure File share to mount.
  /// 
  /// This share must exist in the configured Azure Storage Account.
  late String shareName;

  /// Creates an [AzureFileVolumeSource] from a map of data.
  /// 
  /// The map must contain the following keys:
  /// - 'readOnly': bool
  /// - 'secretName': String
  /// - 'shareName': String
  AzureFileVolumeSource.fromMap(Map<String, dynamic> data) {
    readOnly = data['readOnly'];
    secretName = data['secretName'];
    shareName = data['shareName'];
  }

  factory AzureFileVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$AzureFileVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AzureFileVolumeSourceToJson(this);
}

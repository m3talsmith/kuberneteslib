/// Represents a volume source for Azure File storage.
/// 
/// Azure File is used to mount a Microsoft Azure File Service share to a pod.
class AzureFileVolumeSource {
  /// Determines if the volume should be mounted read-only.
  /// 
  /// When true, the volume will be mounted as read-only.
  late bool readOnly;

  /// The name of the secret containing Azure Storage account name and key.
  late String secretName;

  /// The name of the Azure File Service share to mount.
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
}

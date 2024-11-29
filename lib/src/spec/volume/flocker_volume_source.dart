/// Represents a Flocker volume source in Kubernetes.
/// 
/// Flocker is an open-source Container Data Volume Manager for your Dockerized applications.
class FlockerVolumeSource {
  /// The name of the dataset stored as metadata.
  late String datasetName;

  /// The UUID of the dataset. This is unique identifier that identifies a 
  /// Flocker dataset.
  late String datasetUUID;

  /// Creates a [FlockerVolumeSource] from a map structure.
  /// 
  /// The [data] parameter must contain:
  /// * 'datasetName': String representing the name of the dataset
  /// * 'datasetUUID': String representing the UUID of the dataset
  FlockerVolumeSource.fromMap(Map<String, dynamic> data) {
    datasetName = data['datasetName'];
    datasetUUID = data['datasetUUID'];
  }
}

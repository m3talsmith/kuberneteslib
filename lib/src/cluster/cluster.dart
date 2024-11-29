/// Represents a Kubernetes cluster configuration from a kubeconfig YAML file.
/// 
/// This class contains essential connection details for a Kubernetes cluster,
/// including the API server URL and certificate authority data for secure
/// communication.
class Cluster {
  /// Creates a new [Cluster] instance.
  /// 
  /// Parameters:
  /// - [certificateAuthorityData]: Base64 encoded certificate authority data
  /// - [server]: The Kubernetes API server URL (e.g., "https://1.2.3.4:6443")
  /// - [name]: The name identifier for this cluster configuration
  Cluster({this.certificateAuthorityData, this.server, this.name});

  /// The base64-encoded certificate authority data used for secure cluster
  /// communication.
  String? certificateAuthorityData;

  /// The Kubernetes API server URL for this cluster.
  String? server;

  /// The name identifier for this cluster configuration.
  String? name;

  /// Converts the [Cluster] instance into a Map structure that matches
  /// the kubeconfig YAML format.
  /// 
  /// Returns a Map with nested "cluster" and "name" fields, suitable for
  /// serialization into YAML format.
  Map<String, dynamic> asMap() => {
        "cluster": {
          "certificate-authority-data": certificateAuthorityData,
          "server": server
        },
        "name": name,
      };
}

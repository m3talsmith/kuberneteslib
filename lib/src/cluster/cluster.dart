import 'package:json_annotation/json_annotation.dart';

part 'cluster.g.dart';

/// Represents a Kubernetes cluster configuration from a kubeconfig YAML file.
///
/// This class contains essential connection details for a Kubernetes cluster,
/// including the API server URL and certificate authority data for secure
/// communication.
///
/// Example usage:
/// ```dart
/// final cluster = Cluster(
///   name: 'production-cluster',
///   server: 'https://kubernetes.example.com',
///   certificateAuthorityData: 'base64-encoded-ca-data',
/// );
/// ```
@JsonSerializable()
class Cluster {
  /// Creates a new [Cluster] instance.
  ///
  /// Parameters:
  /// - [certificateAuthorityData]: Base64 encoded certificate authority data
  ///   used to verify the Kubernetes API server's TLS certificate
  /// - [server]: The Kubernetes API server URL (e.g., "https://1.2.3.4:6443")
  /// - [name]: The name identifier for this cluster configuration, used to
  ///   reference this cluster in contexts
  Cluster({this.certificateAuthorityData, this.server, this.name});

  /// The base64-encoded certificate authority data used for secure cluster
  /// communication.
  ///
  /// This data is used to verify the authenticity of the Kubernetes API server's
  /// TLS certificate. It should be the base64-encoded version of the PEM-formatted
  /// certificate authority certificate.
  @JsonKey(includeIfNull: false, name: 'certificate-authority-data')
  String? certificateAuthorityData;

  /// The Kubernetes API server URL for this cluster.
  ///
  /// This URL should include the protocol (https://) and may include a port number.
  /// Example: "https://kubernetes.example.com:6443"
  @JsonKey(includeIfNull: false)
  String? server;

  /// The name identifier for this cluster configuration.
  ///
  /// This name is used to reference the cluster in context configurations and
  /// should be unique within your kubeconfig file.
  @JsonKey(includeIfNull: false, includeToJson: false)
  String? name;

  /// Creates a [Cluster] instance from a JSON map.
  ///
  /// This factory constructor is generated by json_serializable.
  factory Cluster.fromJson(Map<String, dynamic> json) {
    final clusterData = json['cluster'];
    clusterData['name'] = json['name'];
    Map<String, dynamic> data = {};
    for (var e in clusterData.entries) {
      data[e.key] = e.value;
    }
    final cluster = _$ClusterFromJson(data);
    return cluster;
  }

  /// Converts this [Cluster] instance to a JSON map.
  ///
  /// This method is generated by json_serializable.
  Map<String, dynamic> toJson() {
    final clusterJson = _$ClusterToJson(this);
    clusterJson.remove('name');
    // log('clusterJson: $clusterJson');
    final json = {'cluster': clusterJson, 'name': name};
    return json;
  }
}

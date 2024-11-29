import 'projection/config_map_projection.dart';
import 'projection/downward_api_projection.dart';
import 'projection/secret_projection.dart';
import 'projection/service_account_token_projection.dart';

/// Represents a projected volume source in Kubernetes.
/// 
/// VolumeProjection represents volume projection that may be mounted into a container.
/// It can project from multiple sources:
/// - ConfigMap
/// - Downward API
/// - Secret
/// - ServiceAccount token
class VolumeProjection {
  /// Optional ConfigMap projection configuration.
  ConfigMapProjection? configMap;

  /// Optional Downward API projection configuration.
  DownwardAPIProjection? downwardAPI;

  /// Optional Secret projection configuration.
  SecretProjection? secret;

  /// Optional ServiceAccount token projection configuration.
  ServiceAccountTokenProjection? serviceAccountToken;

  /// Creates a VolumeProjection instance from a map structure.
  /// 
  /// [data] should be a map containing one or more of the following keys:
  /// - 'configMap'
  /// - 'downwardAPI'
  /// - 'secret'
  /// - 'serviceAccountToken'
  VolumeProjection.fromMap(Map<String, dynamic> data) {
    if (data['configMap'] != null) {
      configMap = ConfigMapProjection.fromMap(data['configMap']);
    }
    if (data['downwardAPI'] != null) {
      downwardAPI = DownwardAPIProjection.fromMap(data['downwardAPI']);
    }
    if (data['secret'] != null) {
      secret = SecretProjection.fromMap(data['secret']);
    }
    if (data['serviceAccountToken'] != null) {
      serviceAccountToken =
          ServiceAccountTokenProjection.fromMap(data['serviceAccountToken']);
    }
  }
}

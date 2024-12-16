import 'package:kuberneteslib/kuberneteslib.dart';

/// A template class for creating Kubernetes resources with specific API versions.
///
/// ResourceTemplate extends the base [Resource] class to provide a structured way
/// of creating Kubernetes resources with:
/// - Specific API versions (e.g., 'v1', 'apps/v1', 'batch/v1')
/// - Required metadata
/// - Optional specifications and status
///
/// This class is particularly useful when creating new resources or deserializing
/// existing ones from JSON/YAML configurations.
///
/// Example:
/// ```dart
/// final template = ResourceTemplate(
///   kind: 'Pod',
///   metadata: ObjectMeta()..name = 'nginx-pod',
///   apiVersion: 'v1',
/// );
/// ```
///
/// The template handles JSON serialization/deserialization with proper type
/// conversion for all resource fields including specs and status information.
class ResourceTemplate extends Resource {
  /// The API version for this resource (e.g., 'v1', 'apps/v1', 'batch/v1').
  /// Defaults to 'v1' for core API resources.
  final String apiVersion;

  /// Creates a new [ResourceTemplate] with required fields.
  ///
  /// Parameters:
  /// - [kind]: The type of resource (e.g., 'Pod', 'Deployment')
  /// - [metadata]: Resource metadata (name, namespace, labels, etc.)
  /// - [apiVersion]: API version, defaults to 'v1'
  ResourceTemplate(
      {required String kind,
      required ObjectMeta metadata,
      this.apiVersion = 'v1'})
      : super(kind: kind, metadata: metadata);

  /// Creates a [ResourceTemplate] from a JSON map.
  ///
  /// Handles conversion of all nested objects including:
  /// - Metadata
  /// - Specifications based on resource kind
  /// - Status information
  /// - Authentication details
  factory ResourceTemplate.fromJson(Map<String, dynamic> json) =>
      ResourceTemplate(
        kind: json['kind'] as String,
        metadata: ObjectMeta.fromJson(json['metadata'] as Map<String, dynamic>),
        apiVersion: json['apiVersion'] as String? ?? 'v1',
      )
        ..spec = json['spec'] == null
            ? null
            : Spec.fromJson(json['spec'] as Map<String, dynamic>,
                kind: json['kind'])
        ..status = json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, dynamic>)
        ..namespace = json['namespace'] as String?
        ..auth = json['auth'] == null
            ? null
            : ClusterAuth.fromJson(json['auth'] as Map<String, dynamic>);

  /// Converts this [ResourceTemplate] to a JSON map.
  ///
  /// Only includes non-null fields in the output to maintain
  /// clean and minimal JSON representations.
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        if (metadata case final value?) 'metadata': value.toJson(),
        if (spec case final value?) 'spec': value.toJson(),
        if (status case final value?) 'status': value.toJson(),
        if (kind case final value?) 'kind': value,
        if (namespace case final value?) 'namespace': value,
        if (auth case final value?) 'auth': value.toJson(),
        'apiVersion': apiVersion,
      };
}

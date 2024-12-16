import 'package:json_annotation/json_annotation.dart';

import 'env_var_source.dart';

part 'env_var.g.dart';

/// Represents an environment variable in a Kubernetes container.
///
/// EnvVar defines individual environment variables that can be set in containers.
/// Key features include:
/// - Direct value assignment
/// - Dynamic value sourcing
/// - ConfigMap references
/// - Secret references
///
/// Common use cases:
/// - Application configuration
/// - API endpoints
/// - Credentials
/// - Runtime parameters
///
/// Example:
/// ```dart
/// // Direct value
/// final directEnvVar = EnvVar()
///   ..name = 'DATABASE_HOST'
///   ..value = 'postgres.default.svc.cluster.local';
///
/// // ConfigMap reference
/// final configMapEnvVar = EnvVar()
///   ..name = 'API_KEY'
///   ..valueFrom = EnvVarSource()
///     ..configMapKeyRef = ConfigMapKeySelector()
///       ..name = 'api-config'
///       ..key = 'api-key';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)
/// for more details about environment variables in containers.
@JsonSerializable()
class EnvVar {
  EnvVar();

  /// Name of the environment variable.
  ///
  /// Required: Must be a C_IDENTIFIER (consisting of alphanumeric characters
  /// or '_' and must start with an alphabetic character or '_').
  late String name;

  /// Direct string value for the environment variable.
  ///
  /// Optional: Cannot be used if valueFrom is specified.
  /// The value will be used as-is for the environment variable.
  @JsonKey(includeIfNull: false)
  String? value;

  /// Source for the environment variable's value.
  ///
  /// Optional: Cannot be used if value is specified.
  /// Allows referencing values from ConfigMaps, Secrets, and other sources.
  @JsonKey(includeIfNull: false)
  EnvVarSource? valueFrom;

  factory EnvVar.fromJson(Map<String, dynamic> json) => _$EnvVarFromJson(json);

  Map<String, dynamic> toJson() => _$EnvVarToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'windows_security_context_options.g.dart';

/// Represents Windows-specific security configuration for containers in Kubernetes.
///
/// WindowsSecurityContextOptions enables configuring Windows-specific security settings
/// for containers. Key features include:
/// - GMSA credential specification
/// - Host process containers
/// - User context configuration
/// - Windows-specific security policies
///
/// Common use cases:
/// - Active Directory integration
/// - Windows authentication
/// - Privileged Windows containers
/// - Domain-joined containers
///
/// Example:
/// ```dart
/// final windowsSecurity = WindowsSecurityContextOptions()
///   ..gmsaCredentialSpecName = 'webapp-gmsa'
///   ..runAsUserName = 'NT AUTHORITY\\SYSTEM'
///   ..hostProcess = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/windows/user-guide/#configuring-gmsa-for-windows-pods-and-containers)
/// for more details about Windows container security options.
@JsonSerializable()
class WindowsSecurityContextOptions {
  WindowsSecurityContextOptions()
      : gmsaCredentialSpec = '',
        gmsaCredentialSpecName = '',
        hostProcess = false,
        runAsUserName = '';

  /// GMSA credential spec in JSON format.
  ///
  /// Contains the YAML/JSON formatted credential specification for Windows GMSA.
  final String gmsaCredentialSpec;

  /// Name of the GMSA credential spec custom resource.
  ///
  /// References a GMSACredentialSpec resource in the cluster.
  final String gmsaCredentialSpecName;

  /// Indicates if this container should be a Windows HostProcess container.
  ///
  /// When true, runs with elevated privileges on the host Windows node.
  final bool hostProcess;

  /// Windows user account to run the container process as.
  ///
  /// Examples:
  /// - 'NT AUTHORITY\\SYSTEM'
  /// - 'NT AUTHORITY\\LOCAL SERVICE'
  /// - 'NT AUTHORITY\\NETWORK SERVICE'
  final String runAsUserName;

  factory WindowsSecurityContextOptions.fromJson(Map<String, dynamic> json) =>
      _$WindowsSecurityContextOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$WindowsSecurityContextOptionsToJson(this);
}

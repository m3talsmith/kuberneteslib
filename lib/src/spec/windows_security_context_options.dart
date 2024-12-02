/// Configuration options for Windows-specific security context in Kubernetes.
///
/// This class represents security configuration options specific to Windows-based
/// containers in Kubernetes, including GMSA credentials and user context settings.
class WindowsSecurityContextOptions {
  /// The GMSA credential spec containing the YAML formatted credential specification.
  late String gmsaCredentialSpec;

  /// The name of the GMSA credential spec to use.
  late String gmsaCredentialSpecName;

  /// Indicates if this container should be run as a HostProcess container.
  late bool hostProcess;

  /// The username to run the entry point of the container process as.
  late String runAsUserName;

  /// Creates a new [WindowsSecurityContextOptions] instance from a map.
  ///
  /// [data] should contain the following keys:
  /// - 'gmsaCredentialSpec': YAML formatted credential specification
  /// - 'gmsaCredentialSpecName': Name of the GMSA credential spec
  /// - 'hostProcess': Boolean indicating if this is a HostProcess container
  /// - 'runAsUserName': Username for the container process
  WindowsSecurityContextOptions.fromMap(Map<String, dynamic> data) {
    gmsaCredentialSpec = data['gmsaCredentialSpec'];
    gmsaCredentialSpecName = data['gmsaCredentialSpecName'];
    hostProcess = data['hostProcess'];
    runAsUserName = data['runAsUserName'];
  }

  Map<String, dynamic> toMap() => {
        'gmsaCredentialSpec': gmsaCredentialSpec,
        'gmsaCredentialSpecName': gmsaCredentialSpecName,
        'hostProcess': hostProcess,
        'runAsUserName': runAsUserName,
      };
}

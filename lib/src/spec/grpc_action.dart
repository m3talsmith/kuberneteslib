import 'package:json_annotation/json_annotation.dart';

part 'grpc_action.g.dart';

/// Represents a gRPC health check action in Kubernetes.
///
/// GRPCAction defines how to perform health checks against a gRPC service
/// running inside a container. Key features include:
/// - gRPC service health probing
/// - Port specification
/// - Service name targeting
/// - Standard gRPC health checking
///
/// Common use cases:
/// - Microservice health checks
/// - Service mesh monitoring
/// - Application readiness probes
/// - Container liveness verification
///
/// Example:
/// ```dart
/// final grpcProbe = GRPCAction()
///   ..port = 9000
///   ..service = 'my.health.v1.HealthService';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-grpc-liveness-probe)
/// for more details about gRPC probes.
@JsonSerializable()
class GRPCAction {
  GRPCAction();

  /// The port number of the gRPC service.
  /// 
  /// Required: The container port number where the gRPC service is listening.
  /// This must be a valid port number (1-65535).
  late int port;

  /// The name of the gRPC service to probe.
  /// 
  /// Required: The fully qualified name of the gRPC service.
  /// Format: "package.service"
  /// Example: "grpc.health.v1.Health"
  late String service;

  factory GRPCAction.fromJson(Map<String, dynamic> json) =>
      _$GRPCActionFromJson(json);

  Map<String, dynamic> toJson() => _$GRPCActionToJson(this);
}

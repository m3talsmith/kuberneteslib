/// Base interface for all Kubernetes resource specifications.
///
/// Defines the common contract that all resource specifications must implement
/// for JSON serialization.
abstract class ObjectSpec {
  Map<String, dynamic> toJson();
}
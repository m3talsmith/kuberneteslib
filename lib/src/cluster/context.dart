/// A class that represents the contextual information for a Cluster.
///
/// The [Context] class holds information about:
/// * The cluster identifier
/// * The associated user
/// * A name identifier
class Context {
  /// Creates a new [Context] instance.
  ///
  /// All parameters are optional:
  /// * [cluster]: The identifier for the cluster
  /// * [user]: The user associated with this context
  /// * [name]: A name identifier for this context
  Context({this.cluster, this.user, this.name});

  /// The identifier of the cluster.
  String? cluster;

  /// The user associated with this context.
  String? user;

  /// A name identifier for this context.
  String? name;

  /// Converts the [Context] instance into a Map representation.
  ///
  /// Returns a [Map] with the following structure:
  /// ```dart
  /// {
  ///   "context": {
  ///     "cluster": cluster,
  ///     "user": user,
  ///   },
  ///   "name": name,
  /// }
  /// ```
  Map<String, dynamic> asMap() => {
        "context": {
          "cluster": cluster,
          "user": user,
        },
        "name": name,
      };
}

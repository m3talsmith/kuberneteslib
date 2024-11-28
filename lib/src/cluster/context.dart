class Context {
  Context({this.cluster, this.user, this.name});

  String? cluster;
  String? user;
  String? name;

  Map<String, dynamic> asMap() => {
        "context": {
          "cluster": cluster,
          "user": user,
        },
        "name": name,
      };
}

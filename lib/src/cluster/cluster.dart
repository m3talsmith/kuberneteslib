class Cluster {
  Cluster({this.certificateAuthorityData, this.server, this.name});

  String? certificateAuthorityData;
  String? server;
  String? name;

  Map<String, dynamic> asMap() => {
        "cluster": {
          "certificate-authority-data": certificateAuthorityData,
          "server": server
        },
        "name": name,
      };
}

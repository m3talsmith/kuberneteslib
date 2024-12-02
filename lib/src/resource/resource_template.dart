import 'package:kuberneteslib/kuberneteslib.dart';

class ResourceTemplate extends Resource {
  @override
  ResourceTemplate.fromMap(super.data) : super.fromMap() {
    apiVersion = 'v1';
  }

  late final String apiVersion;

  Map<String, dynamic> toMap() => {
        'apiVersion': apiVersion,
      };
}

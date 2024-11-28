import 'package:http/http.dart';

abstract class ClusterAuthClient extends BaseClient {
  static const String userAgent = 'kuberneteslib';
}

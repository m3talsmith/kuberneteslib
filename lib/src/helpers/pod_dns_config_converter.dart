import 'package:json_annotation/json_annotation.dart';

import '../spec/pod_dns_config.dart';

class PodDNSConfigConverter implements JsonConverter<PodDNSConfig, Map<String, dynamic>> {
  const PodDNSConfigConverter();

  @override
  PodDNSConfig fromJson(Map<String, dynamic> json) => PodDNSConfig.fromJson(json);

  @override
  Map<String, dynamic> toJson(PodDNSConfig config) => config.toJson();
}
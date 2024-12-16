import 'package:json_annotation/json_annotation.dart';

import '../spec/pod_security_context.dart';

class PodSecurityContextConverter
    implements JsonConverter<PodSecurityContext, Map<String, dynamic>> {
  const PodSecurityContextConverter();

  @override
  PodSecurityContext fromJson(Map<String, dynamic> json) =>
      PodSecurityContext.fromJson(json);

  @override
  Map<String, dynamic> toJson(PodSecurityContext config) => config.toJson();
}

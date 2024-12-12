import 'package:json_annotation/json_annotation.dart';

import '../spec/local_object_reference.dart';

class LocalObjectReferencesConverter implements JsonConverter<List<LocalObjectReference>, List<Map<String, dynamic>>> {
  const LocalObjectReferencesConverter();

  @override
  List<LocalObjectReference> fromJson(List<Map<String, dynamic>> json) => json.map((e) => LocalObjectReference.fromJson(e)).toList();

  @override
  List<Map<String, dynamic>> toJson(List<LocalObjectReference> config) => config.map((e) => e.toJson()).toList();
}
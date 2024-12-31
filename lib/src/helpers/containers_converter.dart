import 'package:json_annotation/json_annotation.dart';

import '../spec/container.dart';

class ContainersConverter
    implements JsonConverter<List<SpecContainer>, List<Map<String, dynamic>>> {
  const ContainersConverter();

  @override
  List<SpecContainer> fromJson(List<Map<String, dynamic>> json) {
    final containers = <Map<String, dynamic>>[];
    for (var container in json) {
      containers.add(container);
    }
    return containers.map((e) => SpecContainer.fromJson(e)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<SpecContainer> containers) =>
      containers.map((e) => e.toJson()).toList();
}

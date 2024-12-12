import 'package:json_annotation/json_annotation.dart';

import '../spec/container.dart';

class ContainersConverter
    implements JsonConverter<List<Container>, List<Map<String, dynamic>>> {
  const ContainersConverter();

  @override
  List<Container> fromJson(List<Map<String, dynamic>> json) {
    final containers = <Map<String, dynamic>>[];
    for (var container in json) {
      containers.add(container);
    }
    return containers.map((e) => Container.fromJson(e)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<Container> containers) =>
      containers.map((e) => e.toJson()).toList();
}

import 'package:json_annotation/json_annotation.dart';

import '../spec/container_port.dart';

class ContainerPortsConverter implements JsonConverter<List<ContainerPort>, List<Map<String, dynamic>>> {
  const ContainerPortsConverter();

  @override
  List<ContainerPort> fromJson(List<Map<String, dynamic>> json) => json.map(ContainerPort.fromJson).toList();

  @override
  List<Map<String, dynamic>> toJson(List<ContainerPort> ports) => ports.map((e) => e.toJson()).toList();
}

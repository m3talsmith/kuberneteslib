import 'package:yaml/yaml.dart';

/// Converts a YAML node to its corresponding Dart type.
///
/// Handles conversion of:
/// - YamlMap to Map<String, dynamic>
/// - YamlList to List<dynamic>
/// - Other values are returned as-is
dynamic _convertNode(dynamic v) {
  if (v is YamlMap) {
    return fromYamlMap(v);
  } else if (v is YamlList) {
    var list = <dynamic>[];
    for (var e in v) {
      list.add(_convertNode(e));
    }
    return list;
  } else {
    return v;
  }
}

/// Converts a [YamlMap] to a Dart [Map<String, dynamic>].
///
/// Used internally to convert YAML structures to Dart structures.
Map<String, dynamic> fromYamlMap(YamlMap nodes) {
  var map = <String, dynamic>{};
  nodes.forEach((k, v) {
    map[k] = _convertNode(v);
  });
  return map;
}

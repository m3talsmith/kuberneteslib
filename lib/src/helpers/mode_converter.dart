import 'package:json_annotation/json_annotation.dart';

class ModeConverter extends JsonConverter<dynamic, dynamic> {
  const ModeConverter();

  @override
  dynamic fromJson(dynamic json) {
    if (json is String) {
      return int.parse(json, radix: 8);
    } else if (json is int) {
      return encodeMode(json);
    }
    return null;
  }

  @override
  dynamic toJson(dynamic object) {
    if (object is int) {
      return decodeMode(object);
    }
    return object;
  }
}

int? encodeMode(dynamic mode) {
  if (mode is int) {
    if (mode < 0) {
      return null;
    }
    if (mode > 511) {
      mode = '0${mode.toString()}';
      mode = int.parse(mode, radix: 8);
    }
    return mode;
  } else if (mode is String) {
    return int.parse(mode, radix: 8);
  }
  return null;
}

String? decodeMode(int? mode) {
  if (mode == null) {
    return null;
  }
  mode = encodeMode(mode);
  return mode?.toRadixString(8).padLeft(4, '0');
}

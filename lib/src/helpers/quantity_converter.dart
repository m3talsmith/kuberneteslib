import 'package:json_annotation/json_annotation.dart';
import '../spec/quantity.dart';

class QuantityConverter extends JsonConverter<Quantity, String> {
  const QuantityConverter();

  @override
  Quantity fromJson(String json) => json;

  @override
  String toJson(Quantity object) => object ?? '';
}

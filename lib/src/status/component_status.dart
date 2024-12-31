import 'package:json_annotation/json_annotation.dart';

import 'status.dart';
import 'component_status/list_meta.dart';
part 'component_status.g.dart';

@JsonSerializable()
class ComponentStatusStatus implements Status {
  const ComponentStatusStatus({
    this.apiVersion,
    this.items,
    this.kind,
    this.metadata,
  });

  @JsonKey(includeIfNull: false)
  final String? apiVersion;

  @JsonKey(
    includeIfNull: false,
    fromJson: _itemsFromJson,
    toJson: _itemsToJson,
  )
  final List<ComponentStatusStatus>? items;

  @JsonKey(includeIfNull: false)
  final String? kind;

  @JsonKey(
    includeIfNull: false,
    fromJson: _metadataFromJson,
    toJson: _metadataToJson,
  )
  final ComponentStatusListMeta? metadata;

  @override
  factory ComponentStatusStatus.fromJson(Map<String, dynamic> json) =>
      _$ComponentStatusStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ComponentStatusStatusToJson(this);
}

List<ComponentStatusStatus>? _itemsFromJson(List<dynamic>? json) => json
    ?.map((e) => ComponentStatusStatus.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _itemsToJson(List<ComponentStatusStatus>? items) =>
    items?.map((e) => e.toJson()).toList();

ComponentStatusListMeta? _metadataFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ComponentStatusListMeta.fromJson(json);

Map<String, dynamic>? _metadataToJson(ComponentStatusListMeta? metadata) =>
    metadata?.toJson();

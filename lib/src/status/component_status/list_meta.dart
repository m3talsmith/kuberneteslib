import 'package:json_annotation/json_annotation.dart';

part 'list_meta.g.dart';

@JsonSerializable()
class ComponentStatusListMeta {
  const ComponentStatusListMeta({
    this.continueState,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  @JsonKey(includeIfNull: false, name: 'continue')
  final String? continueState;

  @JsonKey(includeIfNull: false)
  final int? remainingItemCount;

  @JsonKey(includeIfNull: false)
  final String? resourceVersion;

  @JsonKey(includeIfNull: false)
  final String? selfLink;

  factory ComponentStatusListMeta.fromJson(Map<String, dynamic> json) =>
      _$ComponentStatusListMetaFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentStatusListMetaToJson(this);
}

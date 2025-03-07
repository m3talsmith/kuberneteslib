import 'package:json_annotation/json_annotation.dart';

import '../spec/resource_requirements.dart';
import 'container/container_state.dart';
import 'status.dart';

part 'container.g.dart';

@JsonSerializable()
class ContainerStatus extends Status {
  ContainerStatus({
    this.allocatedResources,
    this.containerId,
    this.image,
    this.imageId,
    this.lastState,
    this.name,
    this.ready,
    this.resources,
    this.restartCount,
    this.started,
    this.state,
  });

  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? allocatedResources;

  @JsonKey(includeIfNull: false, name: 'containerID')
  String? containerId;

  @JsonKey(includeIfNull: false)
  String? image;

  @JsonKey(includeIfNull: false, name: 'imageID')
  String? imageId;

  @JsonKey(
    includeIfNull: false,
    fromJson: _lastStateFromJson,
    toJson: _lastStateToJson,
  )
  ContainerState? lastState;

  @JsonKey(includeIfNull: false)
  String? name;

  @JsonKey(includeIfNull: false)
  bool? ready;

  @JsonKey(
    includeIfNull: false,
    fromJson: _resourcesFromJson,
    toJson: _resourcesToJson,
  )
  ResourceRequirements? resources;

  @JsonKey(includeIfNull: false)
  int? restartCount;

  @JsonKey(includeIfNull: false)
  bool? started;

  @JsonKey(
    includeIfNull: false,
    fromJson: _stateFromJson,
    toJson: _stateToJson,
  )
  ContainerState? state;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  factory ContainerStatus.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}

ContainerState? _stateFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ContainerState.fromJson(json);

Map<String, dynamic>? _stateToJson(ContainerState? state) => state?.toJson();

ContainerState? _lastStateFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ContainerState.fromJson(json);

Map<String, dynamic>? _lastStateToJson(ContainerState? state) =>
    state?.toJson();

ResourceRequirements? _resourcesFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ResourceRequirements.fromJson(json);

Map<String, dynamic>? _resourcesToJson(ResourceRequirements? resources) =>
    resources?.toJson();

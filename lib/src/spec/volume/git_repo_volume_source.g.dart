// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_repo_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitRepoVolumeSource _$GitRepoVolumeSourceFromJson(Map<String, dynamic> json) =>
    GitRepoVolumeSource()
      ..directory = json['directory'] as String
      ..repository = json['repository'] as String
      ..revision = json['revision'] as String;

Map<String, dynamic> _$GitRepoVolumeSourceToJson(
        GitRepoVolumeSource instance) =>
    <String, dynamic>{
      'directory': instance.directory,
      'repository': instance.repository,
      'revision': instance.revision,
    };

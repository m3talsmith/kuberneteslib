# KubernetesLib

## 0.4.59

- Fixed `Resource.delete` method

## 0.4.39

- Fixed `ResourceKind.ignoreList` and `ResourceKind.ignoreShow`

## 0.4.38

- Fixed Spec deserialization

## 0.4.17

- Fixed `getApi` method for Resource pod kind
- Added `save` method to Resource
- Added `update` method to Resource
- Removed `fromKubernetesYaml` method from Resource
- Added `fromYaml` method to Resource

## 0.3.16

- Added `asKubernetesYaml` method to Resource
- Added `fromKubernetesYaml` method to Resource
- Added `fromYamlMap` helper to `yaml_parser.dart`

## 0.3.15

- Added `apiReadKinds` to Resource
- Added `ignoreList` and `ignoreShow` to ResourceKind

## 0.3.14

- Fixed json serialization for Config

## 0.3.13

- Added `toJson` method to Configs
- Added `fromJson` method to Configs

## 0.3.12

- Added `fromString` method to ResourceKind

## 0.3.11

- Added common List methods to Configs wrapper
- Added documentation for Configs

## 0.3.10

- Improved documentation for many classes

## 0.3.9

- Removed late clause and made fields nullable
- Added test for string values for match label

## 0.3.8

- Corrected example

## 0.3.7

- Updated README

## 0.3.6

- Added documentation for GCEPersistentDiskVolumeSource
- Fixed bug in GCEPersistentDiskVolumeSource

## 0.3.5

- Updated all documentation
- Updated example code

## 0.3.4

- Added example code

## 0.3.3

- Added documentation for ClusterAuth
- Added documentation for Metadata

## 0.3.2

- Improved usage examples in Resource

## 0.3.1

- Added documentation for Resource

## 0.3.0

- Resources can be listed, viewed, and deleted
- Authentication with a cluster is good for cert authentication and bearer authentication

## 0.1.0

- Initial version.

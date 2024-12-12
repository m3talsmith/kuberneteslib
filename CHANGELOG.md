# KubernetesLib

## 0.4.80

- Added tests for PodSpec
- Added tests for Container
- Added tests for ObjectMeta
- Added tests for OwnerReference
- Added tests for FieldsV1
- Added tests for ManagedFieldEntry
- Added tests for Helpers
- Added tests for BearerClient
- Added tests for ClusterAuthClient
- Added tests for CertClient
- Fixed PodSpec deserialization
- Fixed Container deserialization
- Fixed ObjectMeta deserialization
- Fixed OwnerReference deserialization
- Fixed FieldsV1 deserialization
- Fixed ManagedFieldEntry deserialization

## 0.4.79

- Added tests for ObjectMeta
- Added tests for OwnerReference
- Added tests for FieldsV1
- Added tests for ManagedFieldEntry

## 0.4.78

- Added tests for Helpers

## 0.4.77

- Added tests for BearerClient
- Added tests for ClusterAuthClient
- Added tests for CertClient

## 0.4.76

- Added tests for User
- Added tests for Exec
- Added tests for ExecSpec
- Added tests for ExecStatus
- Fixed User deserialization
- Fixed Exec deserialization
- Fixed ExecSpec deserialization
- Fixed ExecStatus deserialization
- Fixed User serialization
- Fixed Exec serialization
- Fixed ExecSpec serialization
- Fixed ExecStatus serialization

## 0.4.75

- Updated README with Slack channel

## 0.4.74

- Fixed toYaml for config

## 0.4.61

- Added `namespace` parameter to `Resource.delete` method
- Added `namespace` parameter to `Resource.fromJson` method

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

import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'mutating_webhook_configuration.g.dart';

@JsonSerializable()
class MutatingWebhookConfigurationStatus implements Status {
  const MutatingWebhookConfigurationStatus();

  @override
  factory MutatingWebhookConfigurationStatus.fromJson(
          Map<String, dynamic> json) =>
      _$MutatingWebhookConfigurationStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$MutatingWebhookConfigurationStatusToJson(this);
}

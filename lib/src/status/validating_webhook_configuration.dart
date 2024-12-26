import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'validating_webhook_configuration.g.dart';

@JsonSerializable()
class ValidatingWebhookConfigurationStatus implements Status {
  const ValidatingWebhookConfigurationStatus();

  @override
  factory ValidatingWebhookConfigurationStatus.fromJson(
          Map<String, dynamic> json) =>
      _$ValidatingWebhookConfigurationStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ValidatingWebhookConfigurationStatusToJson(this);
}

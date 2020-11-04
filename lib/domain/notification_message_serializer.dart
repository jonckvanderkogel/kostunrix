part of 'notification_message.dart';

NotificationMessage _$NotificationMessageFromJson(Map<String, dynamic> json) {
  return NotificationMessage(
    title: json['notification']['title'] as String,
    body: json['notification']['body'] as String,
    insuranceRequestId: int.parse(json['data']['insuranceRequestId']),
    insuranceProposalId: int.parse(json['data']['insuranceProposalId']),
  );
}

NotificationMessage _$NotificationMessageFromJsonOnResume(Map<String, dynamic> json) {
  return NotificationMessage(
    insuranceRequestId: int.parse(json['insuranceRequestId']),
    insuranceProposalId: int.parse(json['insuranceProposalId']),
  );
}
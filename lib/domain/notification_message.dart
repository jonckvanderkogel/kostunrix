part 'notification_message_serializer.dart';

class NotificationMessage {
  String title;
  String body;
  int insuranceRequestId;
  int insuranceProposalId;

  NotificationMessage({this.title="onResume", this.body="onResume", this.insuranceRequestId,
      this.insuranceProposalId});

  factory NotificationMessage.fromJson(Map<String, dynamic> json) => _$NotificationMessageFromJson(json);

  factory NotificationMessage.onResume(Map<String, dynamic> json) => _$NotificationMessageFromJsonOnResume(json);
}
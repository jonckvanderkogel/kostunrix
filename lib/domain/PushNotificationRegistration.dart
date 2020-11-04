class PushNotificationRegistration {
  String token;

  PushNotificationRegistration(this.token);

  PushNotificationRegistration.fromJson(Map<String, dynamic> json) : token = json['token'];

  Map<String, dynamic> toJson() =>
      {
        'token': token
      };
}
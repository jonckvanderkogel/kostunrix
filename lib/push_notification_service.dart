import 'dart:convert';

import 'package:cimpl/base_authenticated_service.dart';
import 'package:cimpl/domain/enums.dart';
import 'package:cimpl/domain/insurance_request.dart';
import 'package:cimpl/domain/notification_message.dart';
import 'package:cimpl/insurance_proposal_overview_page.dart';
import 'package:cimpl/insurance_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cimpl/login_service.dart';
import 'package:cimpl/domain/PushNotificationRegistration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PushNotificationService extends BaseAuthenticatedService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  var notificationUrl = "${LoginService.baseUrl}/notification";

  final _insuranceService = InsuranceService();
  BuildContext context;

  var pushNotificationToken;

  PushNotificationService(this.context) {
    init();
  }

  void _navigateToItemDetail(NotificationMessage notificationMessage) {
    _insuranceService.getOwnInsuranceRequestsByInsuranceRequestStatus(InsuranceRequestStatus.SUBMITTED).then((result) {
      InsuranceRequest request = result.firstWhere((request) => request.id == notificationMessage.insuranceRequestId);
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InsuranceProposalOverviewPage(request: request),
        ),
      );
    });
    
    
  }

  void _showItemDialog(Map<String, dynamic> message) {
    showDialog<bool>(
      context: context,
      builder: (_) => _buildDialog(context, NotificationMessage.fromJson(message)),
    ).then((bool shouldNavigate) {
      if (shouldNavigate == true) {
        final NotificationMessage notificationMessage = NotificationMessage.fromJson(message);
        _navigateToItemDetail(notificationMessage);
      }
    });
  }

  Widget _buildDialog(BuildContext context, NotificationMessage message) {
    return AlertDialog(
      content: Text("${message.body}"),
      actions: <Widget>[
        FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: const Text('SHOW'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }

  void init() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        final NotificationMessage notificationMessage = NotificationMessage.onResume(message);
        _navigateToItemDetail(notificationMessage);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      pushNotificationToken = token;
      print("Push Messaging token: $pushNotificationToken");
      postPushNotificationRegistration(new PushNotificationRegistration(token)).then((response) => print(response));
    });
  }

  Future<String> postPushNotificationRegistration(PushNotificationRegistration registration) async {
    final url = "$notificationUrl/register";
    return http.post(url, headers: getHeaders(), body: jsonEncode(registration) )
        .then((response) {
      if (response.statusCode == 200) {
        var success = response.body;

        return success;
      } else {
        print("error registering token");
        return "error";
      }
    });
  }
}
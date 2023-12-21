import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/main.dart';
import 'package:push_notification/views/notification_page.dart';

class FirebaseServices {
  final _messaging = FirebaseMessaging.instance;

  Future initNotifications() async {
    final fcToken = await _messaging.getToken();
    print(fcToken.toString());
    await initPushNotification();
  }

  void handleMessage(RemoteMessage? message) {
    // if (message == null) return;
    navigatorKey.currentState!
        .pushNamed('/notification_page', arguments: message);
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((message) => handleMessage(message));

    FirebaseMessaging.onMessage.listen(handleMessage);
  }
}

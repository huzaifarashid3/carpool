import 'dart:async';

import 'package:carpool/bug_report.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class notifications {
  final messaging = FirebaseMessaging.instance;
// used to pass messages from event handler to the UI
  final _messageStreamController = BehaviorSubject<RemoteMessage>();
  Future<void> enable_notification_request() async {
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');

      //initialize futher settings for push notifications
    }
    initNotifications();
  }

  Future<String> getToken() async {
    // It requests a registration token for sending messages to users from your App server or other trusted server environment.
    String? token = await messaging.getToken();

    if (kDebugMode) {
      print('Registration Token=$token');
    }

    return token ?? '';
  }

  void listen_foreground_messages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification?.title}');
        print('Message notification: ${message.notification?.body}');
      }

      _messageStreamController.sink.add(message);
    });
  }

  // Function to handle recieved messages
  void handle_message(BuildContext context, RemoteMessage? message) {
    if (message == null) {
      return;
    }
    Navigator.of(context).pushNamed(bug_report.route_name);
  }

  //functiion to initialize the background settings
  Future initNotifications() async {
    // handle if the app was terminated and opened now
    FirebaseMessaging.instance
        .getInitialMessage()
        .then(handle_message as FutureOr Function(RemoteMessage? value));

    //add event listeners when notification opens the app
    FirebaseMessaging.onMessageOpenedApp
        .listen(handle_message as void Function(RemoteMessage message)?);
  }
}

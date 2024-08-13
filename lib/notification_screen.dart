import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class notification_screen extends StatelessWidget {
  static const route_name = 'notification_screen';
  const notification_screen({super.key});

  @override
  Widget build(BuildContext context) {
    //final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: const Column(
        children: [
          // Text(message.notification?.title.toString() ?? ''),
          // Text(message.notification?.body.toString() ?? ''),
          // Text(message.data.toString()),
        ],
      ),
    );
  }
}

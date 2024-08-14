import 'package:flutter/material.dart';

class NotifcationButton extends StatefulWidget {
  const NotifcationButton({
    super.key,
  });

  @override
  State<NotifcationButton> createState() => _NotifcationButtonState();
}

class _NotifcationButtonState extends State<NotifcationButton> {
  bool hasNotfication = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 30,
        child: OutlinedButton(
          onPressed: () {
            NotficationDiaglog(context);
            setState(() {
              hasNotfication = !hasNotfication;
            });
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.grey),

            shape: const CircleBorder(),
            // borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            hasNotfication
                ? Icons.notifications_on_rounded
                : Icons.notifications_outlined,
            color: hasNotfication
                ? const Color.fromARGB(255, 205, 186, 14)
                : Colors.grey,
            size: 16,
          ),
        ),
      ),
    );
  }

  Future<dynamic> NotficationDiaglog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: const Text('You have a new notification!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

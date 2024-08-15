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
    return OutlinedButton(
      onPressed: () {
        if (!hasNotfication) notficationDiaglog(context);
        setState(() {
          hasNotfication = !hasNotfication;
        });
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        shape: const CircleBorder(),
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
    );
  }

  Future<dynamic> notficationDiaglog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('placeholder'),
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

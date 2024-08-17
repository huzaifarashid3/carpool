// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class requests extends StatefulWidget {
  const requests({super.key});

  @override
  State<requests> createState() => _requestsState();
}

class _requestsState extends State<requests> {
  String request_status_text = 'No requests';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(request_status_text),
      ),
    );
  }
}

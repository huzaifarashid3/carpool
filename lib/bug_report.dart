// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class bug_report extends StatelessWidget {
  static const route_name = 'bug_report';
  const bug_report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report a bug',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        backgroundColor: Color.fromARGB(190, 3, 255, 142),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(50, 50, 50, 50),
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Bug Title',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 20, 50, 50),
            width: 200,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Bug Description',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(120, 40, 0, 0),
            child: ElevatedButton(
              onPressed: () {
                // Implement your logic here
              },
              child: Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}

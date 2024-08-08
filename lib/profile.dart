// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:carpool/dialouges/create_route.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  static const route_name = 'profile';

  const profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          ListTile(
            title:
                Text('Create route templates', style: TextStyle(fontSize: 20)),
            tileColor: Color.fromARGB(255, 223, 222, 222),
            textColor: const Color.fromARGB(255, 0, 0, 0),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15)
            // ),
            onTap: () {
              Navigator.of(context).pushNamed(create_route.route_name);
            },
          ),
          ListTile(
            title:
                Text('Create route templates', style: TextStyle(fontSize: 20)),
            tileColor: Color.fromARGB(255, 223, 222, 222),
            textColor: Color.fromARGB(255, 0, 0, 0),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15)
            // ),
            onTap: () {
              //print('hello');
            },
          ),
        ],
      ),
      // backgroundColor:Color.fromARGB(255, 161, 160, 160),
    );
  }
}

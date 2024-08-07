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
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              'Offer a Ride',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle 'Offer a Ride' option
              print('hello');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Offer a Ride'),
                    content: const Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Phone',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Departure Time',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Capacity',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Arriving Fast',
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Offer Ride'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text(
              'Edit Profile Info',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle 'Edit Profile Info' option
            },
          ),
          ListTile(
            title: const Text(
              'Add Your Vehicle Route',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle 'Add Your Vehicle Route' option
            },
          ),
        ],
      ),
    );
  }
}

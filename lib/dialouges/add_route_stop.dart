// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class add_route_stop extends StatelessWidget {
  final int number;

  const add_route_stop({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    TextEditingController addAStopController = TextEditingController();
    return AlertDialog(
      title: const Text('Add a Stop'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //const Text('Enter the stop name: '),
          const SizedBox(height: 10),
          TextField(
            controller: addAStopController,
            decoration: InputDecoration(
              hintText: 'Stop Name',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            //Add Stop Button
            onPressed: () {
              if (addAStopController.text.isNotEmpty) {
                // Implement your logic here
                // You can use add_a_stop_controller.text
                // create_route.route1_stops.add(add_a_stop_controller.text);
                // create_route.rout
              } else {
                //Show error message
              }
              Navigator.of(context).pop();
            },
            child: const Text('Add Stop'),
          ),
        ],
      ),
    );
  }
}

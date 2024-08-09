// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, non_constant_identifier_names

import 'package:carpool/create_route.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class post_ride extends StatefulWidget {
  const post_ride({super.key});

  @override
  State<post_ride> createState() => _post_rideState();
}

class _post_rideState extends State<post_ride> {
  String dropdown_text = 'Choose a Route';
  String time_text = 'Choose Departure Time';
  String after_time_selection_text = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Post a Ride !'),
      icon: const Icon(Icons.directions_car),
      shadowColor: Colors.black,
      content: Container(
        height: 180,
        width: 400,
        child: Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Don\'t have a Route?'),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(create_route.route_name);
                    },
                    child: const Text('Create Now !')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Choose a template'),
                const SizedBox(
                  width: 8,
                  height: 80,
                ),
                DropdownButton(
                  hint: Text(dropdown_text),
                  items: [
                    const DropdownMenuItem(
                      child: Text('Template 1'),
                      value: 'Template 1',
                    ),
                    const DropdownMenuItem(
                      child: Text('Gulshan wala '),
                      value: 'Gulshan wala',
                    ),
                    const DropdownMenuItem(
                      child: Text('Karsaz wala rasta'),
                      value: 'Karsaz wala rasta',
                    )
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdown_text = newValue!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(after_time_selection_text),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      setState(() {
                        time_text = selectedTime.format(context);
                        after_time_selection_text = 'Departure Time:';
                      });
                    }
                  },
                  child: Text(time_text),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Post Now !'),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color?>(Colors.green),
                    foregroundColor:
                        WidgetStateProperty.all<Color?>(Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color?>(Colors.red),
                    foregroundColor:
                        WidgetStateProperty.all<Color?>(Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

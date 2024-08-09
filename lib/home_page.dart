import 'package:carpool/bug_report.dart';
import 'package:carpool/create_route.dart';
import 'package:carpool/dialouges/post_ride.dart';
import 'package:carpool/login.dart';
import 'package:carpool/main.dart';
import 'package:carpool/profile.dart';
import 'package:carpool/signup.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  static const route_name = 'home_page';
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  static String? userLoginID = login.userLoginID;

  @override
  int noOfRides = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 57, 50),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 3, 255, 142),
        leading: Tooltip(
          message: 'Filter',
          child: IconButton(
            onPressed: () {
              // Show filter options for time and location
              // Implement your logic here
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Filter Options'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const Text('Time: '),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                // Show time picker
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((selectedTime) {
                                  if (selectedTime != null) {
                                    // Implement your logic when time is selected
                                    // You can use selectedTime.hour and selectedTime.minute
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  'Select Time',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Location',
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Vehicle Type',
                          ),
                          value: 'car',
                          items: const [
                            DropdownMenuItem(
                              value: 'car',
                              child: Text('Car'),
                            ),
                            DropdownMenuItem(
                              value: 'bike',
                              child: Text('Bike'),
                            ),
                          ],
                          onChanged: (value) {
                            // Implement your logic when vehicle type is changed
                          },
                        ),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Going Fast or Leaving Fast',
                          ),
                          value: 'going_fast',
                          items: const [
                            DropdownMenuItem(
                              value: 'going_fast',
                              child: Text('Going Fast'),
                            ),
                            DropdownMenuItem(
                              value: 'leaving_fast',
                              child: Text('Leaving Fast'),
                            ),
                          ],
                          onChanged: (value) {
                            // Implement your logic when going fast or leaving fast is changed
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Implement your filter logic here

                          Navigator.of(context).pop();
                        },
                        child: const Text('Apply'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.filter_list),
          ),
        ),
        title: const Text(
          'Fast Carpool',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Cards(noOfRides: noOfRides),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(190, 3, 255, 142),
        height: 70,
        surfaceTintColor: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  //POST A R
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return post_ride(); // Post a ride Pop uP
                      });
                },
                child: const Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(signup.route_name);
                },
                icon: const Icon(Icons.home)),
            Tooltip(
              message: 'Report a bug',
              child: IconButton(
                  onPressed: () {
                    print('Report a bug ID: ${userLoginID}');
                    Navigator.of(context).pushNamed(bug_report.route_name);
                  },
                  icon: const Icon(Icons.bug_report)),
            ),
            Tooltip(
                message: 'Profile',
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(profile.route_name);
                  },
                  icon: const CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/img2.jpeg'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

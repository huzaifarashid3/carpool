// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:carpool/create_route.dart';
import 'package:carpool/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class post_ride extends StatefulWidget {
  const post_ride({super.key});

  @override
  State<post_ride> createState() => _post_rideState();
}

class _post_rideState extends State<post_ride> {
  String route_dropdown_text = 'Choose a Route';
  String departure_type_dropdown_text = 'Choose Departure Type';
  String capacity_dropdown_text = 'Seats Available';
  String vehicle_type_dropdown_text = 'Vehicle Type:';
  String time_text = 'Choose Departure Time';
  String user_name = '';
  String time_input = '';
  String departure_type_input = '';
  String after_time_selection_text = '';
  String cant_post_ride_text = '';

  static String route1name = '';
  static String route2name = '';
  static String route3name = '';
  static String route4name = '';

  late String selected_route = '';
  static String selected_time = '';
  static String selected_vehicle_type = '';
  static String selected_departure_type = '';
  static late int selected_capacity;

  static late List route_stops;
  @override
  void initState() {
    super.initState();
    read_route_names();
    get_user_name();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Post a Ride !'),
        icon: const Icon(Icons.directions_car),
        shadowColor: Colors.black,
        content: Container(
          height: 500,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Don\'t have a Route?'),
                  const SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(create_route.route_name);
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
                    hint: Text(route_dropdown_text),
                    items: [
                      DropdownMenuItem(
                        child: Text(route1name),
                        value: route1name,
                      ),
                      DropdownMenuItem(
                        child: Text(route2name),
                        value: route2name,
                      ),
                      DropdownMenuItem(
                        child: Text(route3name),
                        value: route3name,
                      ),
                      DropdownMenuItem(
                        child: Text(route4name),
                        value: route4name,
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        route_dropdown_text = 'Route: ' + newValue!;
                        selected_route = newValue;
                        read_route_stops();
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
                          selected_time = selectedTime.format(context);
                        });
                      }
                    },
                    child: Text(time_text),
                  ),
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
                    hint: Text(departure_type_dropdown_text),
                    items: [
                      const DropdownMenuItem(
                        child: Text('Going Fast'),
                        value: 'Going Fast',
                      ),
                      const DropdownMenuItem(
                        child: Text('Leaving Fast'),
                        value: 'Leaving Fast',
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        departure_type_dropdown_text = newValue!;
                        selected_departure_type = newValue;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 8,
                    height: 80,
                  ),
                  DropdownButton(
                    hint: Text(vehicle_type_dropdown_text),
                    items: [
                      const DropdownMenuItem(
                        child: Text('Car'),
                        value: 'car',
                      ),
                      const DropdownMenuItem(
                        child: Text('Bike'),
                        value: 'bike',
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        vehicle_type_dropdown_text =
                            'Vehicle Type: ' + newValue!;
                        selected_vehicle_type = newValue;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 8,
                    height: 80,
                  ),
                  DropdownButton(
                    hint: Text(capacity_dropdown_text),
                    items: [
                      const DropdownMenuItem(
                        child: Text('1'),
                        value: '1',
                      ),
                      const DropdownMenuItem(
                        child: Text('2'),
                        value: '2',
                      ),
                      const DropdownMenuItem(
                        child: Text('3'),
                        value: '3',
                      ),
                      const DropdownMenuItem(
                        child: Text('4'),
                        value: '4',
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        capacity_dropdown_text =
                            'Seats Available: ' + newValue!;
                        selected_capacity = int.parse(newValue);
                      });
                    },
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
                  Text(
                    cant_post_ride_text,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      //  print('POSTER ID: ${login.userLoginID}');

                      FirebaseFirestore.instance
                          .collection('Rides')
                          .where('owner_id', isEqualTo: login.userLoginID)
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        if (querySnapshot.docs.isNotEmpty) {
                          print('Cannot add ride. User is already an owner.');
                          setState(() {
                            cant_post_ride_text = 'Your ride already exists .';
                          });
                        } else {
                          print("RDIE ADDED");
                          addRide();
                          cant_post_ride_text = '';
                          Navigator.of(context).pop();
                        }
                      }).catchError((error) {
                        print('Error checking owner ID: $error');
                      });
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
                      cant_post_ride_text = '';
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
      ),
    );
  }

  void read_route_names() {
    FirebaseFirestore.instance
        .collection('User')
        .doc(login.userLoginID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          route1name =
              (documentSnapshot.data() as Map<String, dynamic>)['route1name'];
          route2name =
              (documentSnapshot.data() as Map<String, dynamic>)['route2name'];
          route3name =
              (documentSnapshot.data() as Map<String, dynamic>)['route3name'];
          route4name =
              (documentSnapshot.data() as Map<String, dynamic>)['route4name'];
        });
        print('Route names Read successfully');
        print(route1name);
      } else {
        print('Document does not exist on the database');
      }
    }).catchError((error) {
      print('Error reading route names: $error');
    });
  }

  Future<void> addRide() {
    CollectionReference users = FirebaseFirestore.instance.collection('Rides');

    return users
        .add({
          'capacity': selected_capacity,
          'departure': selected_time,
          'going_fast': selected_departure_type == 'Going Fast' ? true : false,
          'name': 'ALto',
          'owner_name': user_name,
          'type': selected_vehicle_type,
          'route': route_stops,
          'owner_id': login.userLoginID,
          'owner_number': login.userNumber,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> get_user_name() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('User')
        .doc(login.userLoginID)
        .get();
    if (documentSnapshot.exists) {
      setState(() {
        user_name = (documentSnapshot.data() as Map<String, dynamic>)['name'];
        print('USERNAMEEEEEE IS: $user_name');
      });
    } else {
      print('User Name Not Found');
    }
    return user_name;
  }

  void read_route_stops() {
    FirebaseFirestore.instance
        .collection('User')
        .doc(login.userLoginID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          if (selected_route == route1name) {
            route_stops = (documentSnapshot.data()
                as Map<String, dynamic>)['route1stops'];
          } else if (selected_route == route2name) {
            route_stops = (documentSnapshot.data()
                as Map<String, dynamic>)['route2stops'];
          } else if (selected_route == route3name) {
            route_stops = (documentSnapshot.data()
                as Map<String, dynamic>)['route3stops'];
          } else if (selected_route == route4name) {
            route_stops = (documentSnapshot.data()
                as Map<String, dynamic>)['route4stops'];
          }
        });
        print('Route stops Read successfully');
        print(route_stops);
      } else {
        print('Document does not exist on the database');
      }
    }).catchError((error) {
      print('Error reading route stops: $error');
    });
  }

  AlertDialog cant_post_ride_dialouge() {
    return const AlertDialog();
  }
}

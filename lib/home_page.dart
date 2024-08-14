// ignore_for_file: non_constant_identifier_names

import 'package:carpool/bug_report.dart';
import 'package:carpool/create_route.dart';
import 'package:carpool/dialouges/post_ride.dart';
import 'package:carpool/login.dart';
import 'package:carpool/main.dart';
import 'package:carpool/notification_screen.dart';
import 'package:carpool/notification_services.dart';
import 'package:carpool/profile.dart';
import 'package:carpool/signup.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class home_page extends StatefulWidget {
  static const route_name = 'home_page';
  // static List route = [];
  static bool posted = false;
  home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
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
  late String selected_route = '';
  String selected_time = '';
  String selected_vehicle_type = '';
  late bool selected_departure_type;
  late int selected_capacity;

  static String? userLoginID = login.userLoginID;

  @override
  void initState() {
    super.initState();
    NotificationServices().requestNotificationPermission();
    NotificationServices().firebaseInit(context);
    NotificationServices().getDeviceToken().then((value) {
      print('New Device Tokem:');
      print(value);
    });
  }

  @override
  int noOfRides = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
          237, 241, 243, 1), //Color.fromARGB(188, 255, 255, 255),
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(237, 241, 243, 1),
      //   leading: Tooltip(
      //     message: 'Filter',
      //     child: IconButton(
      //       onPressed: () {
      //         // Show filter options for time and location
      //         // Implement your logic here
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return SingleChildScrollView(
      //               child: AlertDialog(
      //                 shape: Border.all(
      //                   color: Colors.black,
      //                   width: 1,
      //                 ),
      //                 title: const Text('Apply Filters !'),
      //                 icon: const Icon(Icons.filter_list),
      //                 shadowColor: Colors.black,
      //                 content: Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                   height: 300,
      //                   width: 400,
      //                   child: SingleChildScrollView(
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Text(after_time_selection_text),
      //                             const SizedBox(
      //                               width: 10,
      //                             ),
      //                             TextButton(
      //                               onPressed: () async {
      //                                 TimeOfDay? selectedTime =
      //                                     await showTimePicker(
      //                                   context: context,
      //                                   initialTime: TimeOfDay.now(),
      //                                 );
      //                                 if (selectedTime != null) {
      //                                   setState(() {
      //                                     time_text =
      //                                         selectedTime.format(context);
      //                                     after_time_selection_text =
      //                                         'Departure Time:';
      //                                     var selected_time =
      //                                         selectedTime.format(context);
      //                                   });
      //                                 }
      //                               },
      //                               child: Text(time_text),
      //                             ),
      //                           ],
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             // Text('Choose a template'),
      //                             const SizedBox(
      //                               width: 8,
      //                               height: 80,
      //                             ),
      //                             DropdownButton(
      //                               hint: Text(departure_type_dropdown_text),
      //                               items: const [
      //                                 DropdownMenuItem(
      //                                   value: 'Going Fast',
      //                                   child: Text('Going Fast'),
      //                                 ),
      //                                 DropdownMenuItem(
      //                                   value: 'Leaving Fast',
      //                                   child: Text('Leaving Fast'),
      //                                 ),
      //                               ],
      //                               onChanged: (String? newValue) {
      //                                 setState(() {
      //                                   departure_type_dropdown_text =
      //                                       newValue!;
      //                                   selected_departure_type =
      //                                       newValue == 'Going Fast'
      //                                           ? true
      //                                           : false;
      //                                 });
      //                                 if (selected_departure_type) {
      //                                   // Fetch rides from the database where going_fast is true
      //                                   // You can use a database query or API call here
      //                                   // Example:
      //                                   // final rides = await fetchRides(goingFast: true);
      //                                   // Do something with the fetched rides
      //                                 }
      //                               },
      //                             ),
      //                           ],
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             const SizedBox(
      //                               width: 8,
      //                               height: 80,
      //                             ),
      //                             DropdownButton(
      //                               hint: Text(vehicle_type_dropdown_text),
      //                               items: const [
      //                                 DropdownMenuItem(
      //                                   value: 'car',
      //                                   child: Text('Car'),
      //                                 ),
      //                                 DropdownMenuItem(
      //                                   value: 'bike',
      //                                   child: Text('Bike'),
      //                                 ),
      //                               ],
      //                               onChanged: (String? newValue) {
      //                                 setState(() {
      //                                   vehicle_type_dropdown_text =
      //                                       'Vehicle Type: ' + newValue!;
      //                                   selected_vehicle_type = newValue;
      //                                 });
      //                               },
      //                             ),
      //                           ],
      //                         ),
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             const SizedBox(
      //                               width: 8,
      //                               height: 80,
      //                             ),
      //                             DropdownButton(
      //                               hint: Text(capacity_dropdown_text),
      //                               items: const [
      //                                 DropdownMenuItem(
      //                                   value: '1',
      //                                   child: Text('1'),
      //                                 ),
      //                                 DropdownMenuItem(
      //                                   value: '2',
      //                                   child: Text('2'),
      //                                 ),
      //                                 DropdownMenuItem(
      //                                   value: '3',
      //                                   child: Text('3'),
      //                                 ),
      //                                 DropdownMenuItem(
      //                                   value: '4',
      //                                   child: Text('4'),
      //                                 ),
      //                               ],
      //                               onChanged: (String? newValue) {
      //                                 setState(() {
      //                                   capacity_dropdown_text =
      //                                       'Seats Available: ' + newValue!;
      //                                   selected_capacity = int.parse(newValue);
      //                                 });
      //                               },
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 actions: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Column(
      //                         children: [
      //                           // Text(
      //                           //   cant_post_ride_text,
      //                           //   style: const TextStyle(color: Colors.red),
      //                           // ),
      //                           const SizedBox(height: 10),
      //                           ElevatedButton(
      //                             onPressed: () {
      //                               Cards.test = true;
      //                               refresh();
      //                               Navigator.of(context).pop();
      //                             },
      //                             style: ButtonStyle(
      //                               backgroundColor:
      //                                   WidgetStateProperty.all<Color?>(
      //                                       Colors.green),
      //                               foregroundColor:
      //                                   WidgetStateProperty.all<Color?>(
      //                                       Colors.white),
      //                             ),
      //                             child: const Text('Apply'),
      //                           ),
      //                           const SizedBox(height: 10),
      //                           ElevatedButton(
      //                             onPressed: () {
      //                               // cant_post_ride_text = '';
      //                               Navigator.of(context).pop();
      //                             },
      //                             style: ButtonStyle(
      //                               backgroundColor:
      //                                   WidgetStateProperty.all<Color?>(
      //                                       Colors.red),
      //                               foregroundColor:
      //                                   WidgetStateProperty.all<Color?>(
      //                                       Colors.white),
      //                             ),
      //                             child: const Text('Cancel'),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             );
      //           },
      //         );
      //       },
      //       icon: const Icon(Icons.filter_list),
      //     ),
      //   ),
      //   title: const Text(
      //     'Fast Carpool',
      //     style: TextStyle(
      //         fontSize: 20.0,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black87),
      //   ),
      //   centerTitle: true,
      // ),

      //BODYY
      body: Cards(noOfRides: noOfRides),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 250, 251, 251),
        height: 70,
        elevation: 10,

        // surfaceTintColor: Color.fromARGB(190, 26, 203, 160),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  //POST A R
                  home_page.posted = false;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return post_ride(); // Post a ride Pop uP
                    },
                  );
                  if (home_page.posted = true) {
                    // main.call_listview_builder();
                    home_page.posted = false;
                  }
                  // setState(() {
                  //   noOfRides++;
                  // });
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(notification_screen.route_name);
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

  void refresh() {
    setState(() {});
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:carpool/bug_report.dart';
import 'package:carpool/login.dart';
import 'package:carpool/post_ride.dart';
import 'package:carpool/profile.dart';
import 'package:carpool/ride.dart';
import 'package:carpool/signup.dart';
//import 'package:carpool/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const routeName = 'MyApp';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffold(),
      routes: {
        bug_report.route_name: (_) => bug_report(),
        signup.route_name: (_) => signup(),
        login.route_name: (_) => login(),
        profile.route_name: (_) => profile(),
      },
    );
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  int noOfRides = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    title: Text('Filter Options'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text('Time: '),
                            SizedBox(width: 10),
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
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Select Time',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Location',
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Vehicle Type',
                          ),
                          value: 'car',
                          items: [
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
                          decoration: InputDecoration(
                            labelText: 'Going Fast or Leaving Fast',
                          ),
                          value: 'going_fast',
                          items: [
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
                        child: Text('Apply'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.filter_list),
          ),
        ),
        title: Text(
          'Fast Carpool',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        backgroundColor: Color.fromARGB(190, 3, 255, 142),
        centerTitle: true,
      ),
      body: Cards(noOfRides: noOfRides),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(190, 3, 255, 142),
        height: 70,
        surfaceTintColor: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return post_ride(); // Post a ride Pop Up
                      });
                },
                child: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(signup.route_name);
                },
                icon: Icon(Icons.home)),
            Tooltip(
              message: 'Report a bug',
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(bug_report.route_name);
                  },
                  icon: Icon(Icons.bug_report)),
            ),
            Tooltip(
                message: 'Profile',
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(profile.route_name);
                  },
                  icon: CircleAvatar(
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

class Cards extends StatelessWidget {
  final int noOfRides;

  const Cards({
    super.key,
    required this.noOfRides,
  });

  // Function to fetch Rides
  Future<List<Map<String, dynamic>>> fetchRides() async {
    CollectionReference ridesCollection =
        FirebaseFirestore.instance.collection('Rides');
    QuerySnapshot snapshot = await ridesCollection.get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  List<Map<String, dynamic>> filterRides(List<Map<String, dynamic>> rides) {
    return rides.where((ride) => ride['going_fast'] == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchRides(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No rides available'));
        } else {
          List<Map<String, dynamic>> rides = snapshot.data!;
          return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> ride = rides[index];
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 174, 24),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  name: ride['name'],
                  owner_name: ride['owner_name'],
                  time: ride['departure'],
                  //seats: ride['seats'],
                  going_fast: ride['going_fast'],
                  type: ride['type'],
                  // name: ride['name'],
                  // time: ride['time'],
                ),
              );
            },
          );
        }
      },
    );
  }
}

class Card extends StatelessWidget {
  final String time, name, owner_name, type;
  //final int seats;
  final bool going_fast;

  const Card({
    super.key,
    //required this.seats,
    required this.name,
    required this.owner_name,
    required this.time,
    required this.going_fast,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //isThreeLine: true,
      visualDensity: VisualDensity(horizontal: 4, vertical: 3),
      contentPadding: EdgeInsets.all(10),
      leading: type == 'car'
          ? Icon(Icons.directions_car)
          : Icon(Icons.motorcycle_rounded),
      title: Text(owner_name), //Username here
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Time:'),
              Text(time),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //container holding ride color codes
                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(64, 141, 137, 132),
                ),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  children: [
                    Tooltip(
                      waitDuration: Duration.zero,
                      message: 'Male Seat Booked !',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(255, 9, 140, 150),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        width: 15,
                        height: 15,
                      ),
                    ),
                    Tooltip(
                      waitDuration: Duration.zero,
                      message: 'Male Seat Booked !',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(255, 9, 140, 150),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        width: 15,
                        height: 15,
                      ),
                    ),
                    Tooltip(
                      waitDuration: Duration.zero,
                      message: 'Female Seat Booked !',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(255, 9, 140, 150),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        width: 15,
                        height: 15,
                      ),
                    ),
                    Tooltip(
                      waitDuration: Duration.zero,
                      message: 'Vacant Seat',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(255, 126, 120, 127),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ), //Ride details
      trailing: Column(
        children: [
          //Text('Corolla 2020'),//////
          Icon(Icons.apartment),
          Tooltip(
            message: 'Going Fast',
            waitDuration: Duration.zero,
            child: Icon(
              going_fast ? Icons.arrow_upward : Icons.arrow_downward,
              weight: 3,
              color: going_fast ? Color.fromARGB(255, 74, 181, 21) : Colors.red,
            ),
          ),
        ],
      ), //Seats available , Car model

      onTap: () {
        // Logic when tile is clicked
        print('Tile clicked');
      },
      splashColor: Color.fromARGB(255, 255, 204, 0),
    );
  }
}

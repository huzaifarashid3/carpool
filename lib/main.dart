// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carpool/bug_report.dart';
import 'package:carpool/login.dart';
import 'package:carpool/signup.dart';
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
                  setState(() {
                    noOfRides++;
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
                  onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noOfRides, //total no of rides it needs to add onscreen
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            //color: Color.fromARGB(206, 194, 194, 194),
            color: Color.fromARGB(255, 255, 174, 24),
            borderRadius: BorderRadius.circular(15),
          ),
          //padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: const Card(),
        );
      },
    );
  }
}

class Card extends StatelessWidget {
  const Card({super.key, seats});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //isThreeLine: true,
      visualDensity: VisualDensity(horizontal: 4, vertical: 03),
      contentPadding: EdgeInsets.all(10),
      leading: Icon(Icons.directions_car),
      title: Text('Nizamullah Khan'), //Username here
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Time: 9:00 am'),
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
          //Text('Corolla 2020'),
          Icon(Icons.apartment),
          Tooltip(
            message: 'Going Fast',
            waitDuration: Duration.zero,
            child: Icon(
              Icons.arrow_upward,
              weight: 3,
              color: Color.fromARGB(255, 74, 181, 21),
            ),
          )
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carpool/bug_report.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static const route_name = 'MyApp';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffold(),
      routes: {
        bug_report.route_name: (_) => bug_report(),
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
  int no_of_rides = 10;
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
      body: ListView.builder(
        itemCount: no_of_rides, //total no of rides it needs to add onscreen
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              //color: Color.fromARGB(206, 194, 194, 194),
              color: Color.fromARGB(255, 255, 174, 24),
              borderRadius: BorderRadius.circular(15),
            ),
            //padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),

            child: ListTile(
              visualDensity: VisualDensity(horizontal: 4, vertical: 03),
              contentPadding: EdgeInsets.all(10),
              leading: Icon(Icons.directions_car),
              title: Text('Nizamullah Khan'), //Username here
              titleTextStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
              subtitle: Text('Leaves Fast: 9:00 am'), //Ride details
              trailing:
                  Text('Seats: 3\nCorolla 2020'), //Seats available , Car model

              onTap: () {
                // Logic when tile is clicked
                print('Tile clicked');
              },
              splashColor: Color.fromARGB(255, 255, 204, 0),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(190, 3, 255, 142),
        height: 70,
        surfaceTintColor: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  print('hello');
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

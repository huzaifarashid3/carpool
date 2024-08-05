// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carpool/bug_report.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const routeName = 'MyApp';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 59, 255, 154)),
      ),
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
  int noOfRides = 1;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: 'Filter',
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
        ),
        title: Text(
          'Fast Carpool',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
      ),
      body: Cards(noOfRides: noOfRides),
      bottomNavigationBar: BottomAppBar(
        color: theme.colorScheme.primary,
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
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: const Card(),
          ),
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
                          color: Color.fromARGB(255, 254, 38, 171),
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
              color: Colors.green,
            ),
          )
        ],
      ), //Seats available , Car model

      onTap: () {
        // Logic when tile is clicked
        print('Tile clicked');
      },
    );
  }
}

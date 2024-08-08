// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:carpool/bug_report.dart';
import 'package:carpool/dialouges/create_route.dart';
import 'package:carpool/home_page.dart';
import 'package:carpool/login.dart';
import 'package:carpool/profile.dart';
import 'package:carpool/list_tile.dart';
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
      home: login(),
      routes: {
        bug_report.route_name: (_) => bug_report(),
        signup.route_name: (_) => signup(),
        login.route_name: (_) => login(),
        profile.route_name: (_) => profile(),
        home_page.route_name: (_) => home_page(),
        create_route.route_name: (_) => create_route(),
      },
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
    return list_tile(
      name: name,
      time: time,
      owner_name: owner_name,
      type: type,
      going_fast: going_fast,
    );
  }
}

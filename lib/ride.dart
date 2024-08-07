// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

class ride {
  int? id;
  final String name;
  late final String phone;
  bool ariving_fast = true;
  int capacity = 4;
  String departure_time = '12:00';
  late int owner_id;
  ride({
    required this.name,
  });

  Future<void> getData() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Vehicle');

    QuerySnapshot snapshot = await users.get();

    if (snapshot.docs.isEmpty) {
      print("No documents found");
      return;
    }

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      print("Document ID: ${doc.id}");
      print("Full Name: ${data['name']}");
      print("Phone Number: ${data['number']}");
      print("------");
    }
  }

  fetchRides() async {
    List rides = [];
    CollectionReference rideCollection =
        FirebaseFirestore.instance.collection('Rides');
    QuerySnapshot rideSnapshot = await rideCollection.get();

    if (rideSnapshot.docs.isEmpty) {
      print("No rides found");
      return;
    }

    for (QueryDocumentSnapshot rideDoc in rideSnapshot.docs) {
      Map<String, dynamic> rideData = rideDoc.data() as Map<String, dynamic>;
      rides.add(rideData);
    }

    //print(xxr);
    //print(rides);
  }
}

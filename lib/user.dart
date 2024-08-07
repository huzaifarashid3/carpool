import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class user {
  int? id;
  final String name;
  // final String email;
  // final String password;
  final String phone;

  user({
    required this.name,
    required this.phone,
  });

  Future<void> addUser(name, phone) {
    // Call the user's CollectionReference to add a new user
    CollectionReference users = FirebaseFirestore.instance.collection('User');

    return users
        .add({
          'name': name, // John Doe
          'number': phone, // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+92 3340 202  266',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

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

  Future<void> makeTile() async {}

  // toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     // 'email': email,
  //     // 'password': password,
  //     'phone': phone,
  //   };
  // }
  // @override
  // Widget build(BuildContext context) {
  //   // Create a CollectionReference called users that references the firestore collection
  //   CollectionReference users = FirebaseFirestore.instance.collection('User');

  //   Future<void> addUser(name,phone) {
  //     // Call the user's CollectionReference to add a new user
  //     return users
  //         .add({
  //           'name': name, // John Doe
  //           'number': phone, // Stokes and Sons

  //         })
  //         .then((value) => print("User Added"))
  //         .catchError((error) => print("Failed to add user: $error"));
  //   }

  //   return TextButton(
  //     onPressed: addUser,
  //     child: Text(
  //       "Add User",
  //     ),
  //   );
  // }
}

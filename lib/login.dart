// ignore_for_file: prefer_const_constructors

import 'package:carpool/home_page.dart';
import 'package:carpool/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  // ignore: constant_identifier_names

  static const route_name = 'login';
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNumber();
  }

  Future<void> _loadNumber() async {
    final prefs = await SharedPreferences.getInstance();

    String? local_number = prefs.getString('number') ?? '';
    String? local_password = prefs.getString('password') ?? '';
    if (await checkCredentials(local_number, local_password)) {
      Navigator.pushNamed(context, home_page.route_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                controller: phoneController,
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.fromLTRB(50, 20, 50, 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                controller: passwordController,
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement login functionality
                  verifyLogin(context);
                },
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'signup');
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }

  void verifyLogin(BuildContext context) async {
    if (phoneController.text.isEmpty) {
      print('Phone number is empty');
    } else if (passwordController.text.isEmpty) {
      print('Password is empty');
    } else {
      try {
        bool isLoggedIn = await checkCredentials(
          phoneController.text,
          passwordController.text,
        );
        if (isLoggedIn) {
          Navigator.pushNamed(context, home_page.route_name);
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
              .collection('User')
              .doc(phoneController.text)
              .get();
          if (userSnapshot != null) {
            String documentId = userSnapshot.id;
            print('Document ID: $documentId');
          }
        } else {
          print('Invalid phone number or password');
        }
      } catch (e) {
        print('Login failed: $e');
      }
    }
  }

  Future<bool> checkCredentials(String phoneNumber, String password) async {
    try {
      // Get all the user documents from Firestore
      var userDocs = await FirebaseFirestore.instance.collection('User').get();

      // Check if any user document matches the phone number and password
      for (var userDoc in userDocs.docs) {
        if (userDoc['number'] == phoneNumber &&
            userDoc['password'] == password) {
          return true;
        }
      }

      return false;
    } catch (e) {
      print('Error checking credentials: $e');
      return false;
    }
  }
}

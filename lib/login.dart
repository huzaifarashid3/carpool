// ignore_for_file: prefer_const_constructors

import 'package:carpool/screens.dart';
import 'package:carpool/notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  // ignore: constant_identifier_names
  static String? userLoginID, userNumber;
  static const route_name = 'login';
  login({super.key, Key? otherKey});

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // Remove the initState method

  // Future<void> _loadNumber(BuildContext context) async {
  //   final prefs = await SharedPreferences.getInstance();

  //   String? localNumber = prefs.getString('number') ?? '';
  //   String? localPassword = prefs.getString('password') ?? '';
  //   if (await checkCredentials(localNumber, localPassword)) {
  //     Navigator.pushNamed(context, home_page.route_name);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
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
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color?>(Colors.white),
                  elevation: WidgetStateProperty.all<double?>(3.0),
                ),
                onPressed: () {
                  // TODO: Implement login functionality
                  verifyLogin(context);
                },
                child: Text('Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, 'signup');
            //   },
            //   child: Text('Signup'),
            // ),
          ],
        ),
      ),
    );
  }

  void verifyLogin(BuildContext context) async {
    if (phoneController.text.isEmpty) {
      //dialouge for phone number is empty
    } else if (passwordController.text.isEmpty) {
      //dialouge for pass is empty
    } else {
      try {
        bool isLoggedIn = await checkCredentials(
          phoneController.text,
          passwordController.text,
        );
        if (isLoggedIn) {
          Future<String> tok = notifications().getToken();
          print('Token: $tok');
          screens();
          Navigator.pushNamed(context, screens.route_name);
        } else {
          //dialouge to be created
          print('Invalid phone number or password');
        }
      } catch (e) {
        print('Login failed: $e');
      }
    }
  }

  Future<bool> checkCredentials(String phoneNumber, String password) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('User');
      QuerySnapshot snapshot = await users.get();

      // Check if any user document matches the phone number and password
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (data['number'] == phoneNumber && data['password'] == password) {
          print("yoyo login Document ID: ${doc.id}");
          userLoginID = doc.id;
          userNumber = data['number'];

          print('UserLoginID: $userLoginID');
          print('Number : $userNumber');
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

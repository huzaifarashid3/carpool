// ignore_for_file: prefer_const_constructors, constant_identifier_names, camel_case_types, non_constant_identifier_names

import 'dart:io';

// import 'package:carpool/user.dart';
import 'package:carpool/notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carpool/login.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:file_picker/file_picker.dart';

class signup extends StatelessWidget {
  static const route_name = 'signup';
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _number_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  // final TextEditingController _password_controller = TextEditingController();
  // final TextEditingController __controller = TextEditingController();
  late File _image;

  signup({super.key});

  // void getImageFile() {
  //   ImageHelper().showPhotoBottomDialog(
  //     context,
  //     Platform.isIOS,
  //     (file) {
  //       setState(() {
  //         print("File=${file.toString()}");
  //         this.file = file;
  //       });
  //     },
  //     fileFormat: FileFormat.image, //by default is image
  //   );
  // }

  Future pick_image_from_gallery() async {
    final picked_image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked_image != null) {
      final image = File(picked_image.path);
      setState() {
        _image = image;
      }
    }
  }

  //const signup({super.key});
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      // Do something with the image file
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: const Text(
        //   'Sign Up',
        //   style: TextStyle(
        //       fontSize: 20.0,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.black87),
        // ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Signup Page',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(50, 50, 50, 30),
                    width: 300,
                    child: TextField(
                      controller: _name_controller,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
                width: 300,
                child: TextFormField(
                  controller: _number_controller,
                  decoration: const InputDecoration(
                    hintText: 'Phone number: +92321345678',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
                width: 300,
                child: TextFormField(
                  controller: _password_controller,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Container(
              //   color: Colors.white,
              //   margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
              //   width: 300,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       pick_image_from_gallery();
              //     },
              //     child: const Text('Upload Image'),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your logic here
                    // _pickImage();
                    // print(
                    //     'Name: ${_name_controller.text} , Number: ${_number_controller.text}, Password: ${_password_controller.text}');
                    addUser(_name_controller.text, _number_controller.text,
                        _password_controller.text);
                  },
                  child: const Text('Signup'),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).pushNamed(login.route_name);
              //     },
              //     child: const Text('Login'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUser(name, phone, password) async {
    try {
      // Call the user's CollectionReference to add a new user
      CollectionReference users = FirebaseFirestore.instance.collection('User');
      String tok = await notifications().getToken();
      print('Sign up usr token: $tok');
      //tok = tok ?? ''; // Set tok to an empty string if it is null
      await users
          .add({
            'name': name, // John Doe
            'number': phone, // Stokes and Sons
            'password': password,
            'route1name': '',
            'route2name': '',
            'route3name': '',
            'route4name': '',
            'route1stops': [],
            'route2stops': [],
            'route3stops': [],
            'route4stops': [],
            'token': tok,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (e) {
      print("Error: $e");
    }
  }
}

// ignore_for_file: prefer_const_constructors, constant_identifier_names, camel_case_types, non_constant_identifier_names

import 'dart:io';

// import 'package:carpool/user.dart';
import 'package:flutter/material.dart';
import 'package:carpool/login.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:file_picker/file_picker.dart';

class signup extends StatelessWidget {
  static const route_name = 'signup';
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _number_controller = TextEditingController();
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
      backgroundColor: Color.fromARGB(234, 255, 254, 254),
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        backgroundColor: const Color.fromARGB(190, 3, 255, 142),
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
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    pick_image_from_gallery();
                  },
                  child: const Text('Upload Image'),
                ),
              ),

              // ...

              // ...

              // Container(
              //   color: Colors.white,
              //   margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
              //   width: 300,
              //   child: TextFormField(
              //     decoration: const InputDecoration(
              //       hintText: 'Confirm Password',
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your logic here
                    _pickImage();
                  },
                  child: const Text('Signup'),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(login.route_name);
                  },
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

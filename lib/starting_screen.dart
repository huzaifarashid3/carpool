// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class starting_screen extends StatefulWidget {
  const starting_screen({super.key});

  @override
  State<starting_screen> createState() => _starting_screenState();
}

class _starting_screenState extends State<starting_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('FAST CARPOOL'),
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.topCenter,
            child: const Text(
              "F A S T   C A R P O O L",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            //  margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          ),
          const Center(
            child: SizedBox(
              width: 500,
              height: 600,
              child: RiveAnimation.asset(
                'assets/rivs/rivebot.riv',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('login');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color?>(Colors.black),
                    elevation: WidgetStateProperty.all<double?>(5.0),
                  ),
                  child: const Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('signup');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color?>(Colors.white),
                    elevation: WidgetStateProperty.all<double?>(5.0),
                  ),
                  child: const Text('Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

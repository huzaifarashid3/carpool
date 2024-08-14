
import 'package:carpool/Models/user_state.dart';
import 'package:carpool/rides_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carpool/Models/ride_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carpool',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RideState()),
          ChangeNotifierProvider(create: (context) => UserState()),
        ],
        child: SafeArea(child: RidesPage()),
      ),
    );
  }
}

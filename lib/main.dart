import 'package:carpool/Models/ui_state.dart';
import 'package:carpool/Models/user_state.dart';
import 'package:carpool/rides_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carpool/Models/ride_state.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RideState()),
        ChangeNotifierProvider(create: (context) => UserState()),
        ChangeNotifierProvider(create: (context) => UiState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carpool',
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const SafeArea(child: RidesPage()),
        // child: FittedBox(
        //   child: SizedBox(
        //     width: 40,
        //     height: 20,
        //     child: Image.asset(
        //       'assets/images/car.png',
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

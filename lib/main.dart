// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Fast Carpool',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          backgroundColor: Color.fromARGB(190, 3, 255, 142),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Card();
          },
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        minVerticalPadding: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        leading: Icon(Icons.directions_car),
        title: Text('Corolla'),
        subtitle: Text(
          'Leaves Fast: 9:30am\nCar: Corolla\nSeats: 3',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        trailing: Icon(Icons.more_vert),
        tileColor: const Color.fromARGB(255, 219, 178,
            117), // Add this line to change the background color to orange
      ),
    );
  }
}

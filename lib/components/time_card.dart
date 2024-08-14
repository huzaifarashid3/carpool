import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String time;
  const TimeCard({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 66, 66, 66),
      ),
      child: Center(
        child: Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            // fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}

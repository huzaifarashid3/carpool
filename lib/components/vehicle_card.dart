import 'dart:math';
import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  final String vehicleName, vehicleType;
  final bool going;
  const VehicleCard(
      {super.key,
      required this.vehicleType,
      required this.vehicleName,
      required this.going});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromARGB(255, 66, 66, 66),
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.flip(
              flipX: going,
              child: Text(
                vehicleType == "CAR" ? "🚙" : "🏍️",
                style: const TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 224, 224, 224)),
              ),
            ),
            // SizedBox(
            //   width: 40,
            // child: Image.asset('lib/assets/car.png'),
            // ),
            const SizedBox(height: 4),
            Text(
              vehicleName.substring(0, min(15, vehicleName.length)),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}

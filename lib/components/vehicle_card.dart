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
    bool flip = going;
    // just a temporary fix for original orientation of bike begin opposite
    if (vehicleType == "BIKE") {
      flip = !going;
    }
    return ColoredBox(
      color: const Color.fromARGB(255, 66, 66, 66),
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.flip(
              flipX: flip,
              // flutter issue color takes all space for colorFitltered widget
              // the images are not nice
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    going
                        ? Colors.yellow
                        : const Color.fromARGB(255, 245, 183, 178),
                    BlendMode.modulate),
                child: Image.asset(
                  vehicleType == "CAR"
                      ? 'assets/images/car.png'
                      : 'assets/images/bike.png',
                  width: 45,
                  height: 45,
                ),
              ),
            ),
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

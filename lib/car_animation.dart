import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarAnimation extends StatelessWidget {
  const CarAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 60),
          child: Lottie.network(
              "https://lottie.host/92898da8-7314-4538-9d72-c171302562dd/G1BOK2Carw.json"
              // 'assets/car_animation.json',
              ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

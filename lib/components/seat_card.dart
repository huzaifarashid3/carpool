import 'package:flutter/material.dart';

class SeatCard extends StatelessWidget {
  const SeatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: i < 2
                          ? Color.fromARGB(255, 220, 136, 10)
                          : Colors.grey[500],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
      ],
    );
  }
}

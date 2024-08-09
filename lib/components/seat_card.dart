import 'package:flutter/material.dart';

class SeatCard extends StatelessWidget {
  final int occupied, capacity;
  const SeatCard({super.key, required this.occupied, required this.capacity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: capacity,
        itemBuilder: (context, index) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: ColoredBox(
                color: index < occupied
                    ? const Color.fromARGB(255, 220, 136, 10)
                    : const Color.fromARGB(255, 158, 158, 158),
                child: const SizedBox(
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}

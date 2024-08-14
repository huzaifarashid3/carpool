import 'package:carpool/driver_bar.dart';
import 'package:carpool/rides_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final ScrollController controller;
  const BottomBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 8, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: DriverBar(),
          ),
          const SizedBox(width: 10),
          SearchButton(
            controller: controller,
          ),
        ],
      ),
    );
  }
}

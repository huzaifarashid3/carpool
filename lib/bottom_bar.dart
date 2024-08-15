import 'package:carpool/driver_bar.dart';
import 'package:carpool/rides_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 8, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DriverBar(),
          ),
          SizedBox(width: 10),
          SearchButton(),
        ],
      ),
    );
  }
}

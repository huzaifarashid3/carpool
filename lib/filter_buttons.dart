import 'package:carpool/Models/ride_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final List<bool> _selections = [false, false];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ToggleButtons(
          // renderBorder: false,
          isSelected: _selections,
          borderColor: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          onPressed: (index) {
            setState(() {
              _selections[index] = !_selections[index];
              if (index == 0) _selections[1] = false;
              if (index == 1) _selections[0] = false;
            });
            context.read<RideState>().filterRides(
                leaving: _selections[0] == false ? null : true,
                going: _selections[1] == false ? null : true);
          },
          children: const [
            SizedBox(
              width: 80,
              height: 30,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "LEAVING",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 80,
              child: Center(
                child: Text(
                  "GOING",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}

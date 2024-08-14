import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final List<bool> _selections = [false, false];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
      child: SizedBox(
        height: 30,
        child: ToggleButtons(
            // renderBorder: false,
            isSelected: _selections,
            borderColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            onPressed: (index) => setState(() {
                  _selections[index] = !_selections[index];
                  if (index == 0) _selections[1] = false;
                  if (index == 1) _selections[0] = false;
                }),
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
      ),
    );
    // return Row(
    //   children: [
    //     const SizedBox(width: 20),
    //     ElevatedButton(
    //       onPressed: () {},
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: const Color.fromARGB(255, 238, 238, 238),
    //         elevation: 1,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //       ),
    //       child: const Text(
    //         'LEAVING',
    //         style: TextStyle(
    //           color: Color.fromARGB(255, 109, 109, 109),
    //           letterSpacing: 2,
    //           fontSize: 10,
    //         ),
    //       ),
    //     ),
    //     const SizedBox(width: 10),
    //     ElevatedButton(
    //       onPressed: () {},
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: const Color.fromARGB(255, 238, 238, 238),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         elevation: 1,
    //       ),
    //       child: const Text(
    //         'GOING',
    //         style: TextStyle(
    //           color: Color.fromARGB(255, 109, 109, 109),
    //           letterSpacing: 2,
    //           fontSize: 10,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

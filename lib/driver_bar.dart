import 'package:flutter/material.dart';
import 'package:hsv_color_pickers/hsv_color_pickers.dart';
import 'components/seat_card.dart';

class DriverBar extends StatefulWidget {
  const DriverBar({super.key});

  @override
  State<DriverBar> createState() => _DriverBarState();
}

class _DriverBarState extends State<DriverBar> {
  bool rideStarted = false;

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('ADD RIDE',
                        style: TextStyle(
                          color: Color.fromARGB(255, 116, 116, 116),
                          fontSize: 20,
                        )),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          rideStarted = !rideStarted;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const CapacityInput(),
              // const RouteInput(),
              const VehicleInput(),
              const SizedBox(
                height: 40,
              ),
              const ChooseCar(),
              // slider for change color
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    rideStarted = !rideStarted;
                    Navigator.pop(context);
                  });
                },
                child: const Text("add"),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child: rideStarted
            ? const SeatCard(
                occupied: 3,
                capacity: 3,
              )
            : const Text('ADD RIDE',
                style: TextStyle(color: Colors.white, letterSpacing: 2)),
      ),
    );
  }
}

class CapacityInput extends StatelessWidget {
  const CapacityInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('capacity: '),
        SizedBox(
          width: 50,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class RouteInput extends StatelessWidget {
  const RouteInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class VehicleInput extends StatelessWidget {
  const VehicleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('vehicle: '),
        SizedBox(
          width: 50,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class ChooseCar extends StatefulWidget {
  const ChooseCar({super.key});

  @override
  State<ChooseCar> createState() => _ChooseCarState();
}

double hueColor = 0.0;

class _ChooseCarState extends State<ChooseCar> {
  @override
  Widget build(BuildContext context) {
    HSLColor color = HSLColor.fromAHSL(1.0, hueColor, 0.6, 0.8);
    return Row(
      children: [
        ColorFiltered(
          // reduce saturation
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.modulate),
          child: HuePicker(
            initialColor: HSVColor.fromColor(color.toColor()),
            onChanged: (color) {
              setState(() {
                // color = color.toColor() as HSVColor;
                hueColor = color.hue;
              });
            },
            trackHeight: 6,
            thumbShape: const HueSliderThumbShape(
              color: Colors.white,
              // borderColor: Colors.black,
              filled: false,
              showBorder: true,
            ),
          ),
        ),
        ColorFiltered(
          colorFilter: ColorFilter.mode(color.toColor(), BlendMode.modulate),
          child: Image.asset(
            'assets/images/bike.png',
            width: 80,
            height: 80,
          ),
        ),
      ],
    );
  }
}

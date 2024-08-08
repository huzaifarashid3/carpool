import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.card});

  final Map<String, dynamic> card;
  @override
  Widget build(BuildContext context) {
    const blue = Colors.blue,
        red = Colors.red,
        purple = Colors.purple,
        orange = Colors.orange;
    const TextStyle style = TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
    );
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Column(children: [
                RouteCard(),
                SeatCard(),
                InfoCard(),
              ]),
              Column(
                children: [
                  Row(
                    children: [
                      TimeCard(),
                      VehicleCard(),
                    ],
                  )
                ],
              ), //
            ],
          ),
        ),
      ),
    );
  }
}

class RouteCard extends StatelessWidget {
  const RouteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row();
  }
}

class SeatCard extends StatelessWidget {
  const SeatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row();
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row();
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

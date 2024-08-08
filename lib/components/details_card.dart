import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.card});

  final Map<String, dynamic> card;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // ← Add this.

    final blue = Colors.blue,
        red = Colors.red,
        purple = Colors.deepPurple[200],
        orange = Colors.orange,
        yellow = Color.fromARGB(221, 210, 194, 54);
    const TextStyle style = TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
    );
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) {},
              backgroundColor: yellow,
              foregroundColor: Colors.white,
              label: 'BOOK',
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  RouteCard(),
                  SizedBox(height: 10),
                  SeatCard(),
                  SizedBox(height: 10),
                  InfoCard(),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[800],
              ),
              height: 90,
              child: SizedBox(
                width: 50,
                child: TimeCard(),
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 102,
              color: Colors.grey[800],
              child: SizedBox(
                width: 65,
                child: VehicleCard(),
              ),
            ), //
          ],
        ),
      ),
    );
  }
}

class RouteCard extends StatelessWidget {
  const RouteCard({super.key});

  @override
  Widget build(BuildContext context) {
    const int n = 5;
    return Row(
      children: [
        for (int i = 0; i < n; i++)
          Row(
            children: [
              Container(
                  height: 20,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(" loc "))),
              if (i < n - 1)
                Container(
                  height: 2,
                  width: 15,
                  color: Colors.grey[600],
                ),
            ],
          ),
      ],
    );
  }
}

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
                      color: Colors.grey[500],
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

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});
  final String name = 'Huzaifa Rashid';
  final String contact = '1234567890';

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(fontSize: 12);
    return Row(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(name, style: style),
      ),
      SizedBox(width: 10),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(contact, style: style),
      ),
    ]);
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("12\n30", style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 1),
        Text("today",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 12,
            )),
      ],
    );
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String vehicle = 'CIVIC';
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "🚗",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 4),
        Text(
          vehicle,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }
}

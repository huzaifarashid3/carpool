import 'package:carpool/cards_state.dart';
import 'package:carpool/components/route_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsCard extends StatefulWidget {
  final int cardIndex;
  const DetailsCard({
    super.key,
    required this.cardIndex,
  });

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // ← Add this.
    var cardsState = context.watch<CardsState>();
    bool _booked = cardsState.cards[widget.cardIndex]['booked'] as bool;

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
      color: _booked ? Color.fromARGB(255, 231, 227, 197) : Colors.grey[200],
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) {
                context.read<CardsState>().book(widget.cardIndex);
              },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCard(),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[800],
                        ),
                        child: TimeCard(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 120,
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
        child: Text(name.toUpperCase(), style: style),
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
    return Text(
      "12:30 AM",
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontFamily: GoogleFonts.bebasNeue().fontFamily,
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String vehicle = 'CIVIC';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "🏍️",
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

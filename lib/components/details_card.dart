import 'package:carpool/cards_state.dart';
import 'package:carpool/components/info_card.dart';
import 'package:carpool/components/route_card.dart';
import 'package:carpool/components/seat_card.dart';
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
    var cardsState = context.read<CardsState>();
    final booked = cardsState.cards[widget.cardIndex].booked;
    final name = cardsState.cards[widget.cardIndex].name;
    final contact = cardsState.cards[widget.cardIndex].contact;

    final blue = Colors.blue,
        red = Colors.red,
        purple = Colors.deepPurple[200],
        orange = Colors.orange,
        yellow = Color.fromARGB(221, 210, 194, 54);
    const TextStyle style = TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
    );
    return SizedBox(
      height: 123,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: booked ? Color.fromARGB(255, 231, 227, 197) : Colors.grey[200],
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              if (booked)
                SlidableAction(
                  onPressed: (context) {
                    cardsState.unbook(widget.cardIndex);
                  },
                  backgroundColor: red,
                  foregroundColor: Colors.white,
                  label: 'UNBOOK',
                )
              else
                SlidableAction(
                  // An action can be bigger than the others.
                  onPressed: (context) {
                    cardsState.book(widget.cardIndex);
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
                    SizedBox(height: 15),
                    SeatCard(),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoCard(name: name, contact: contact),
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
                color: Colors.grey[800],
                child: SizedBox(
                  width: 65,
                  child: VehicleCard(),
                ),
              ), //
            ],
          ),
        ),
      ),
    );
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
        fontWeight: FontWeight.w100,
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
          style: TextStyle(fontSize: 24, color: Colors.grey[300]),
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

import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/components/details_card.dart';
import 'package:carpool/components/seat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});
  final name = 'Huzaifa Rashid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'R I D E S',
              style: TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
            ),
            GradientAnimationText(
              text: Text('SWIPE TO BOOK',
                  style: TextStyle(
                    color: Color.fromARGB(255, 116, 116, 116),
                    letterSpacing: 4,
                  )),
              reverse: true,
              colors: [
                Color.fromARGB(255, 134, 134, 134),
                Color.fromARGB(255, 177, 177, 177),
                Color.fromARGB(255, 199, 199, 199),
                Color.fromARGB(255, 202, 201, 201),
                Color.fromARGB(255, 221, 220, 220),
              ],
              duration: Duration(seconds: 5),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.grey[200],
      ),
      body: SafeArea(
        child: LiquidPullToRefresh(
          height: 40,
          showChildOpacityTransition: false,
          springAnimationDurationInMilliseconds: 0,
          animSpeedFactor: 2,
          // backgroundColor: Colors.red,
          color: Colors.grey[200],
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: const DetailsCards(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 8, 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: DriverBar(),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              backgroundColor: Colors.grey[800],
              onPressed: () {},
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsCards extends StatelessWidget {
  const DetailsCards({super.key});

  @override
  Widget build(BuildContext context) {
    RideState cardsState = context.watch<RideState>();
    final unbookedCards = cardsState.unbookedRides;
    final bookedCards = cardsState.bookedRides;
    final cards = [...bookedCards, ...unbookedCards];
    return ListView.builder(
      itemCount: cards.length + 1,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(8),
        child: index < cards.length
            ? DetailsCard(rideIndex: cards[index])
            : const SizedBox(height: 100),
      ),
    );
  }
}

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ADD RIDE',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 116, 116, 116),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}

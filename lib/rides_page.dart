import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/components/details_card.dart';
import 'package:carpool/driver_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:provider/provider.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});
  final name = 'Huzaifa Rashid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: ElevatedButton(onPressed: () {}, child: const Text('hi')),
            ),
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
          // SliverToBoxAdapter(
          //   child: DetailsCards(),
          // ),
          const DetailsCards(),
        ],
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
    return SliverList.builder(
      itemCount: cards.length + 1,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(8),
        child: index < cards.length
            ? DetailsCard(rideIndex: cards[index])
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SizedBox(
                    height: 300,
                    child: Text(
                      cards.length > 5
                          ? "OUT OF RIDES"
                          : cards.length == 0
                              ? "NO RIDES"
                              : "",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 134, 134, 134),
                        fontSize: 20,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

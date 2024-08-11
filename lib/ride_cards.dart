import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/components/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RideCards extends StatefulWidget {
  const RideCards({super.key});

  @override
  State<RideCards> createState() => _RideCardsState();
}

class _RideCardsState extends State<RideCards> {
  var fetchedCards;
  @override
  void initState() {
    super.initState();
    fetchedCards = context.read<RideState>().fetchCards();
  }

  @override
  Widget build(BuildContext context) {
    RideState cardsState = context.watch<RideState>();
    final unbookedCards = cardsState.unbookedRides;
    final bookedCards = cardsState.bookedRides;
    final cards = [...bookedCards, ...unbookedCards];
    return FutureBuilder(
      future: fetchedCards,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCards();
        }
        return SliverList.builder(
          itemCount: cards.length + 1,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(8),
            child: index < cards.length
                ? RideCard(rideIndex: cards[index])
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: SizedBox(
                        height: 300,
                        child: Text(
                          cards.length > 8
                              ? "NO MORE RIDES"
                              : cards.isEmpty
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
      },
    );
  }
}

class LoadingCards extends StatelessWidget {
  const LoadingCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const ColoredBox(
              color: Colors.white,
              child: SizedBox(
                height: 118,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

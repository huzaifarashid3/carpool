import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/components/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RideCards extends StatefulWidget {
  final ScrollController listController;
  const RideCards({super.key, required this.listController});

  @override
  State<RideCards> createState() => _RideCardsState();
}

class _RideCardsState extends State<RideCards> {
  late Future<List<int>> fetchedCards;
  @override
  void initState() {
    super.initState();
    fetchedCards = context.read<RideState>().fetchCards();
  }

  @override
  Widget build(BuildContext context) {
    final RideState appState = context.watch<RideState>();
    return FutureBuilder(
      future: fetchedCards,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCards();
        }
        // this calcuation should be done in a future .... will cause jank
        final List<int> bookedCards = appState.bookedRides;
        final List<int> unbookedCards = appState.unbookedRides;
        final List<int> cards = [...bookedCards, ...unbookedCards];
        return LoadedCards(cards: cards, widget: widget);
      },
    );
  }
}

class LoadedCards extends StatelessWidget {
  const LoadedCards({
    super.key,
    required this.cards,
    required this.widget,
  });

  final List<int> cards;
  final RideCards widget;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: cards.length + 1,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(8),
        child: index < cards.length
            ? RideCard(
                rideIndex: cards[index],
                controller: widget.listController,
              )
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

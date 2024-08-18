import 'dart:async';

import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/components/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RideCards extends StatefulWidget {
  const RideCards({
    super.key,
  });

  @override
  State<RideCards> createState() => _RideCardsState();
}

class _RideCardsState extends State<RideCards> {
  late Stream<List<int>> fetchedCards;
  @override
  void initState() {
    super.initState();
    fetchedCards = context.read<RideState>().fetchCards;
  }

  @override
  Widget build(BuildContext context) {
    // context.watch<RideState>();
    return StreamBuilder(
      stream: fetchedCards,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCards();
        }

        // use snapshot.data to get the data from the stream
        return LoadedCards(cards: snapshot.data!);
      },
    );
  }
}

class LoadedCards extends StatelessWidget {
  const LoadedCards({
    super.key,
    required this.cards,
  });

  final List<int> cards;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: cards.length + 1,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(8),
        child: index < cards.length
            ? RideCard(
                key: ValueKey(
                    cards[index]), // this is tie the widget to the state
                rideIndex: cards[index],
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
      itemCount: 20,
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

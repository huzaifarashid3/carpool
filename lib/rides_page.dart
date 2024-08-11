import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/components/ride_card.dart';
import 'package:carpool/driver_bar.dart';
import 'package:carpool/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});
  final name = 'Huzaifa Rashid';
  final contact = '0300-1234567';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [TopBar(name: name, contact: contact)];
        },
        body: const RideCards(),
      ),
      floatingActionButton: const BottomBar(),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 8, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DriverBar(),
          ),
          SizedBox(width: 10),
          SearchButton(),
        ],
      ),
    );
  }
}

class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  late Color bgColor;
  late Color icnColor;
  late bool toggled;

  @override
  void initState() {
    super.initState();
    bgColor = const Color.fromARGB(255, 66, 66, 66);
    icnColor = Colors.white;
    toggled = false;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: bgColor,
      onPressed: () {
        setState(() {
          toggled = !toggled;
          bgColor = toggled
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 66, 66, 66);
          icnColor = toggled ? Colors.black : Colors.white;
        });
      },
      child: Icon(
        Icons.search,
        color: icnColor,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class RideCards extends StatelessWidget {
  const RideCards({super.key});

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
  }
}

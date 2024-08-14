import 'package:carpool/driver_bar.dart';
import 'package:carpool/ride_cards.dart';
import 'package:carpool/top_bar.dart';
import 'package:flutter/material.dart';

class RidesPage extends StatelessWidget {
  RidesPage({super.key});
  final name = 'Huzaifa Rashid';
  final contact = '0300-1234567';
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 10), () {
    //   controller.animateTo(
    //     controller.position.minScrollExtent,
    //     duration: const Duration(seconds: 2),
    //     curve: Curves.easeIn,
    //   );
    // });
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // this ways allows for any type of scrollable widget to be in body
      // but i am unable to scroll to top of the page
      // body: NestedScrollView(
      //   headerSliverBuilder: (context, innerBoxIsScrolled) {
      //     return [TopBar(name: name, contact: contact)];
      //   },
      //   body: const RideCards(),
      // ),
      // floatingActionButton: const BottomBar(),
      body: CustomScrollView(
        controller: controller,
        slivers: [
          const TopBar(),
          RideCards(listController: controller),
        ],
      ),
      // body: Container(child: context.read<RideState>().car),
      floatingActionButton: BottomBar(
        controller: controller,
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final ScrollController controller;
  const BottomBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 8, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: DriverBar(),
          ),
          const SizedBox(width: 10),
          SearchButton(
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class SearchButton extends StatefulWidget {
  final ScrollController controller;
  const SearchButton({
    super.key,
    required this.controller,
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
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom ==
          0.0, // this is to prevernt fab from showing when keyboard is open
      child: FloatingActionButton(
        backgroundColor: bgColor,
        onPressed: () {
          setState(() {
            toggled = !toggled;
            bgColor = toggled
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 66, 66, 66);
            icnColor = toggled ? Colors.black : Colors.white;
            widget.controller.animateTo(
              widget.controller.position.minScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
          });
        },
        child: Icon(
          Icons.search,
          color: icnColor,
        ),
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

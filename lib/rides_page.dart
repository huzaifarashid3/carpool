import 'package:carpool/driver_bar.dart';
import 'package:carpool/ride_cards.dart';
import 'package:carpool/top_bar.dart';
import 'package:flutter/material.dart';

ScrollController controller = ScrollController();

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});
  final name = 'Huzaifa Rashid';
  final contact = '0300-1234567';

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
          TopBar(name: name, contact: contact),
          const RideCards(),
        ],
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

          controller.animateTo(
            controller.position.minScrollExtent,
            duration: const Duration(seconds: 2),
            curve: Curves.easeIn,
          );
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

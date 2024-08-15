import 'package:carpool/Models/ui_state.dart';
import 'package:carpool/bottom_bar.dart';
import 'package:carpool/ride_cards.dart';
import 'package:carpool/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});

  final name = 'Huzaifa Rashid';

  final contact = '0300-1234567';

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController =
        context.read<UiState>().scrollController;
    // Future.delayed(const Duration(seconds: 10), () {
    //   controller.animateTo(
    //     controller.position.minScrollExtent,
    //     duration: const Duration(seconds: 2),
    //     curve: Curves.easeIn,
    //   );
    // });
    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 245, 245, 245),
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
        controller: scrollController,
        slivers: const [
          TopBar(),
          RideCards(),
        ],
      ),
      // body: Container(child: context.read<RideState>().car),
      floatingActionButton: const BottomBar(),
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
    final ScrollController scrollController =
        context.read<UiState>().scrollController;
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
            scrollController.animateTo(
              scrollController.position.minScrollExtent,
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

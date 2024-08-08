import 'package:carpool/components/details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});

  final name = 'Huzaifa Rashid';

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Container(
        height: 400,
        color: Colors.grey[200],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'R I D E S',
              style: TextStyle(color: const Color.fromARGB(255, 116, 116, 116)),
            ),
            GradientAnimationText(
              text: Text('SWIPE TO BOOK',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 116, 116, 116),
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
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(8),
              child: DetailsCard(card: {'name': name}),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 8, 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FloatingActionButton(
                backgroundColor: Colors.grey[800],
                onPressed: () {
                  _showModalBottomSheet(context);
                },
                child: Text(
                  'ADD RIDE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    wordSpacing: 6,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              backgroundColor: Colors.grey[800],
              onPressed: () {},
              child: Icon(
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

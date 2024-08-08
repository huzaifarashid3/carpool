import 'package:carpool/components/details_card.dart';
import 'package:flutter/material.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});
  final name = 'Huzaifa Rashid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(8),
            child: DetailsCard(card: {'name': name}),
          ),
        ),
      ),
    );
  }
}

import 'package:carpool/components/details_card.dart';
import 'package:flutter/material.dart';

class RidesPage extends StatelessWidget {
  const RidesPage({super.key});
  final name = 'Huzaifa Rashid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => DetailsCard(card: {'name': name}),
        ),
      ),
    );
  }
}

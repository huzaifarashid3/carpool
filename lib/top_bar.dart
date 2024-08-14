import 'package:carpool/filter_buttons.dart';
import 'package:carpool/notifcation_button.dart';
import 'package:carpool/user_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      expandedHeight: 210,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            UserCard(),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButtons(),
                NotifcationButton(),
              ],
            ),
          ],
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'R I D E S',
            style: TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
          ),
          SwipeText(),
        ],
      ),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
    );
  }
}

class CarAnimation extends StatelessWidget {
  const CarAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 60),
          child: Lottie.network(
            'assets/car_animation.json',
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class SwipeText extends StatelessWidget {
  const SwipeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.rtl,
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: const Text(
        'SWIPE TO BOOK',
        style: TextStyle(
          color: Color.fromARGB(255, 116, 116, 116),
          letterSpacing: 4,
        ),
      ),
    );
  }
}

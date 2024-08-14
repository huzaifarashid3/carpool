import 'package:carpool/Models/ui_state.dart';
import 'package:carpool/filter_buttons.dart';
import 'package:carpool/notifcation_button.dart';
import 'package:carpool/user_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    final uiState = context.watch<UiState>();
    final bool isEditing = uiState.isEditing;
    return SliverAppBar(
      pinned: true,
      expandedHeight: 210,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const UserCard(),
            const SizedBox(height: 40),
            if (!isEditing)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SearchField(),
                  FilterButtons(),
                  NotifcationButton(),
                ],
              ),
          ],
        ),
      ),
      title: const Row(
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
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for rides',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
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

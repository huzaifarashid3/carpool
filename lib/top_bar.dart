import 'package:carpool/filter_buttons.dart';
import 'package:carpool/user_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final uiState = context.watch<UiState>();
    // final bool isEditing = uiState.isEditing;
    return const SliverAppBar(
      pinned: true,
      expandedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            // if (!isEditing)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 12),
                FilterButtons(),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SearchField(),
                    // NotifcationButton(),
                    ProfileButton(),
                    SizedBox(width: 10),
                  ],
                ),
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

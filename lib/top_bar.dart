import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.name,
    required this.contact,
  });

  final String name;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: UserCard(name: name, contact: contact),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'R I D E S',
            style: TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
          ),
          SwipeText(),
          // GradientAnimationText(
          //   text: Text('SWIPE TO BOOK',
          //       style: TextStyle(
          //         color: Color.fromARGB(255, 116, 116, 116),
          //         letterSpacing: 4,
          //       )),
          //   reverse: true,
          //   colors: [
          //     Color.fromARGB(255, 134, 134, 134),
          //     Color.fromARGB(255, 177, 177, 177),
          //     Color.fromARGB(255, 199, 199, 199),
          //     Color.fromARGB(255, 202, 201, 201),
          //     Color.fromARGB(255, 221, 220, 220),
          //   ],
          //   duration: Duration(seconds: 5),
          // )
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.grey[200],
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

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.contact,
  });

  final String name;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              child: Text("Welcome, $name",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 116, 116, 116),
                    fontSize: 20,
                  )),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Text("CONTACT: $contact",
              style: const TextStyle(
                color: Color.fromARGB(255, 116, 116, 116),
                fontSize: 20,
              )),
        ),
      ],
    );
  }
}

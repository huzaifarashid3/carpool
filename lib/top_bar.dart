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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Text("Welcome, $name",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 116, 116, 116),
                        fontSize: 20,
                      )),
                ),
                const SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'edit',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  // child: Icon(
                  //   Icons.edit,
                  //   color: Colors.grey,
                  //   size: 18,
                  // )),
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
        ),
      ],
    );
  }
}

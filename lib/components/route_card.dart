import 'dart:math';

import 'package:flutter/material.dart';

class RouteCard extends StatelessWidget {
  RouteCard({super.key});
  final List loc = ["FAST", "NORTH NAZIMABAD", "GULSHAN", "NAGAN", "HOME"];
  @override
  Widget build(BuildContext context) {
    int n = loc.length;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: n,
          itemBuilder: (context, i) => Row(
            children: [
              Container(
                  height: 20,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 115, 115),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AnimatedText(loc: loc[i])),
              if (i < n - 1)
                SizedBox(
                  height: 2,
                  width: 15,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 117, 117, 117)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    super.key,
    required this.loc,
  });

  final String loc;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool condensed = true;
  static const int n = 8;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        condensed = !condensed;
      }),
      child: AnimatedSize(
        duration: Duration(milliseconds: 100),
        child: Center(
            child: Text(
                " ${widget.loc.substring(0, min(condensed ? n : 1000, widget.loc.length))} ")),
      ),
    );
  }
}

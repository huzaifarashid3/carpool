import 'dart:math';

import 'package:flutter/material.dart';

class RouteCard extends StatelessWidget {
  final List<String> route;
  const RouteCard({super.key, required this.route});
  @override
  Widget build(BuildContext context) {
    int n = route.length;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: n,
          itemBuilder: (context, i) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 115, 115),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AnimatedText(loc: route[i])),
              if (i < n - 1)
                const ColoredBox(
                  color: Color.fromARGB(255, 117, 117, 117),
                  child: SizedBox(
                    height: 2,
                    width: 15,
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
  static const int n = 7;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        condensed = !condensed;
      }),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: Center(
            child: Text(
                " ${widget.loc.substring(0, min(condensed ? n : 1000, widget.loc.length))} ${condensed && n < widget.loc.length ? ".. " : ""}")),
      ),
    );
  }
}

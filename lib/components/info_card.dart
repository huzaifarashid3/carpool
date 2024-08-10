import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.contact,
  });
  final String name;
  final String contact;

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 12, color: Colors.white);
    // return Row(
    //   children: [
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[700],
      ),
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: Text(name, style: style),
      ),
    );
    //     const SizedBox(width: 10),
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: Colors.grey[700],
    //       ),
    //       height: 20,
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
    //         child: Text(contact, style: style),
    //       ),
    //     ),
    //   ],
    // );
  }
}

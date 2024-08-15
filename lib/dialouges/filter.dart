// import 'package:carpool/main.dart';
// import 'package:carpool/notification_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class filter extends StatefulWidget {
//   const filter({super.key});

//   @override
//   State<filter> createState() => _filterState();
// }

// class _filterState extends State<filter> {
//   String filter_dropdown_text = 'select Departure type';
//   @override
//   Widget build(BuildContext context) {
//     return getfilterDialouge();
//   }

//   FittedBox getfilterDialouge() {
//     return FittedBox(
//       fit: BoxFit.contain,
//       child: AlertDialog(
//         title: const Text('filter Rides'),
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Text('Choose a template'),
//             const SizedBox(
//               width: 8,
//               height: 80,
//             ),
//             DropdownButton(
//               hint: Text(filter_dropdown_text),
//               items: const [
//                 DropdownMenuItem(
//                   child: Text('Going Fast'),
//                   value: 'Going Fast',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Leaving Fast'),
//                   value: 'Leaving Fast',
//                 ),
//               ],
//               onChanged: (String? newValue) {
//                 setState(() {
//                   if (newValue == 'Going Fast') {
//                     Cards.filtered_going_fast = true;
//                     notification_screen.gf = true;
//                     Cards.filter_ride = true;
//                     notification_screen.isSwitched = true;
//                     filter_dropdown_text = 'Goig Fast';
//                   } else if (newValue == 'Leaving Fast') {
//                     Cards.filtered_going_fast = false;
//                     Cards.filter_ride = true;
//                     notification_screen.gf = false;
//                     notification_screen.isSwitched = true;
//                     filter_dropdown_text = newValue.toString();
//                   } else {
//                     Cards.filtered_going_fast = null;
//                     Cards.filter_ride = true;
//                     notification_screen.isSwitched = false;
//                     filter_dropdown_text = '';
//                   }
//                 });
//               },
//             ),
//           ],
//         ),
//         // Column(
//         //   children: [
//         //     Row(
//         //       children: [
//         //         const Text('Going Fast'),
//         //         Switch(
//         //           value: gf,
//         //           onChanged: (value) {
//         //             setState(() {
//         //               gf = !gf;
//         //             });
//         //           },
//         //         ),
//         //       ],
//         //     ),
//         //     Row(
//         //       children: [
//         //         const Text('Leaving Fast'),
//         //         Switch(
//         //           value: lf,
//         //           onChanged: (value) {
//         //             setState(() {
//         //               lf = value;
//         //             });
//         //           },
//         //         ),
//         //       ],
//         //     ),
//         //   ],
//         // ),

//         actions: [
//           TextButton(
//             onPressed: () {
//               // setState(() {
//               //   // if (gf == true) {
//               //   //   Cards.filtered_going_fast = true;
//               //   //   isSwitched = true;
//               //   // } else if(lf=true){
//               //   //   Cards.filtered_going_fast = false;
//               //   //   isSwitched = true;
//               //   // }
//               // });
//                 notification_screen().refresh();

//               Navigator.of(context).pop();
//             },
//             child: const Text('Apply'),
//           ),
//         ],
//       ),
//     );
//   }
// }

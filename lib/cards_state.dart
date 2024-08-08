import 'package:flutter/material.dart';

class CardsState extends ChangeNotifier {
  var cards = [
    {'name': 'Huzaifa Rashid', 'booked': false},
    {'name': 'Huzaifa Rashid', 'booked': false},
    {'name': 'Huzaifa Rashid', 'booked': false},
    {'name': 'Huzaifa Rashid', 'booked': false},
  ];

  void book(int i) {
    cards[i]['booked'] = !(cards[i]['booked'] as bool);
    notifyListeners();
  }
}

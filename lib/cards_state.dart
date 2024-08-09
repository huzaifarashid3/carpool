import 'dart:math';

import 'package:flutter/material.dart';

class Vehicle {
  String name;
  String type;
  String color = "red";
  Vehicle({
    required this.name,
    required this.type,
  });
}

class Card {
  String name;
  String contact;
  bool booked = false;
  int capacity;
  int occupied = 0;
  Vehicle vehicle;
  List<String> route;
  final time = DateTime.now();

  Card(
      {required this.name,
      required this.booked,
      required this.contact,
      required this.capacity,
      required this.route,
      required this.vehicle});

  void book() {
    booked = true;
  }

  void unbook() {
    booked = false;
  }

  void occupySeat() {
    occupied = min(occupied + 1, capacity);
  }

  void vacateSeat() {
    occupied = max(occupied - 1, 0);
  }
}

class CardsState extends ChangeNotifier {
  List<Card> cards = List.generate(
    5,
    (i) => Card(
        name: 'Huzaifa Rashid',
        booked: i < 3,
        contact: '03001234567',
        capacity: 4,
        route: ['Lahore', 'Islamabad'],
        vehicle: Vehicle(name: 'Toyota Corolla', type: 'Car')),
  );

  void book(int index) async {
    cards[index].book();
    notifyListeners();
  }

  void unbook(int index) async {
    cards[index].unbook();
    notifyListeners();
  }

  List<Card> get bookedCards {
    return cards.where((card) => card.booked).toList();
  }

  List<Card> get unbookedCards {
    return cards.where((card) => !card.booked).toList();
  }

  // void addCard(String name) {}

  // void removeCard(int index) {}
}

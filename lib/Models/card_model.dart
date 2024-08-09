import 'dart:math';

class Vehicle {
  String name;
  String type;
  String color = "red";
  Vehicle({
    required this.name,
    required this.type,
  });
}

class Ride {
  String name;
  String contact;
  bool booked = false;
  int capacity;
  int occupied = 0;
  Vehicle vehicle;
  List<String> route;
  final time = DateTime.now();

  Ride(
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

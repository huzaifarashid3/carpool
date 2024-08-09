import 'dart:math';

class Ride {
  bool booked = false;
  int capacity, occupied = 0;
  String name, contact, vehicleName, vehicleType, departureTime;
  List<String> route;

  Ride(
      {required this.name,
      required this.booked,
      required this.contact,
      required this.capacity,
      required this.occupied,
      required this.route,
      required this.vehicleName,
      required this.vehicleType,
      required this.departureTime});

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

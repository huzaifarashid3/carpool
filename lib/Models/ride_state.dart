import 'package:carpool/Models/ride_model.dart';
import 'package:flutter/material.dart';

class RideState extends ChangeNotifier {
  List<Ride> rides = List.generate(
    20,
    (i) => Ride(
      name: 'Huzaifa Rashid',
      booked: i < 2,
      contact: '03001234567',
      capacity: 4,
      occupied: 2,
      route: [
        'Lahore',
        'Islamabad',
        'Karachi',
        "Quetta",
        "Nathiagali",
        "Murree"
      ],
      vehicleName: 'Toyota Corolla',
      vehicleType: 'CAR',
      departureTime: '12:00 PM',
    ),
  );

  void book(int index) async {
    rides[index].book();
    notifyListeners();
  }

  void unbook(int index) async {
    rides[index].unbook();
    notifyListeners();
  }

  List<int> get bookedRides {
    List<int> bRides = [];
    for (int i = 0; i < rides.length; i++) {
      if (rides[i].booked) {
        bRides.add(i);
      }
    }
    return bRides;
  }

  List<int> get unbookedRides {
    List<int> ubRides = [];
    for (int i = 0; i < rides.length; i++) {
      if (!rides[i].booked) {
        ubRides.add(i);
      }
    }
    return ubRides;
  }

  void refresh() {
    notifyListeners();
  }
}

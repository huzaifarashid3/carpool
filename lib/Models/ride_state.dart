import 'dart:async';

import 'package:carpool/Models/firestore_service.dart';
import 'package:carpool/Models/ride_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RideState extends ChangeNotifier {
  RideState() {
    refresh();
    autoRefresh();
  }

  final firestore = FirestoreService();
  final _controller = StreamController<List<int>>();
  Stream<List<int>> get fetchCards => _controller.stream;
  List<Ride> allRides = [];

  bool? going;
  bool? leaving;

  List<int> get allRidesIndices {
    return List.generate(allRides.length, (i) => i);
  }

  void setGoing(bool? value) {
    going = value;

    refresh();
  }

  void setLeaving(bool? value) {
    leaving = value;
    refresh();
  }

  void book(int index) async {
    allRides[index].book();
    firestore.updateRide(allRides[index]);
    refresh();
  }

  void unbook(int index) async {
    allRides[index].unbook();
    firestore.updateRide(allRides[index]);
    refresh();
  }

  List<int> bookedRides(ridesIndices) {
    return ridesIndices.where((element) => allRides[element].booked).toList();
  }

  List<int> unbookedRides(ridesIndices) {
    return ridesIndices.where((element) => !allRides[element].booked).toList();
  }

  List<int> arrangeRides(ridesIndices) {
    return [...bookedRides(ridesIndices), ...unbookedRides(ridesIndices)];
  }

  List<int> filterRides(ridesIndices, {bool? going, bool? leaving}) {
    {
      return ridesIndices
          .where((i) =>
              (going == null || allRides[i].going == going) &&
              (leaving == null || allRides[i].going != leaving))
          .toList();
    }
  }

  List<int> dataPipeline(ridesIndices, {bool? going, bool? leaving}) {
    return arrangeRides(
        filterRides(ridesIndices, going: going, leaving: leaving));
  }

  void refresh() async {
    final List<Ride> fetchedRides = await firestore.fetchRides();
    allRides = fetchedRides;
    _controller
        .add(dataPipeline(allRidesIndices, going: going, leaving: leaving));
  }

  void autoRefresh() async {
    Timer.periodic(const Duration(seconds: 10), (t) async {
      // do this thing in an isolate
      final List<Ride> fetchedRides = await firestore.fetchRides();
      allRides = fetchedRides;
      _controller
          .add(dataPipeline(allRidesIndices, going: going, leaving: leaving));
      debugPrint("refreshing");
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}













  // List<Ride> RIDES = List.generate(
  //   10,
  //   (i) {
  //     int capacity = Random().nextInt(4) + 1;
  //     int occupied = Random().nextInt(capacity) + 1;
  //     return Ride(
  //       name: i % 2 == 0 ? 'Huzaifa Rashid' : 'Ismail Qayyum',
  //       booked: i < 2,
  //       contact: '03001234567',
  //       going: Random().nextInt(4) < 2,
  //       capacity: capacity,
  //       occupied: occupied,
  //       route: [
  //         'Lahore',
  //         'Islamabad',
  //         'Karachi',
  //         "Quetta",
  //         "Nathiagali",
  //         "Murree"
  //       ],
  //       vehicleName: 'Toyota Corolla',
  //       vehicleType: 'CAR',
  //       departureTime: '12:00 PM',
  //     );
  //   },
  // );
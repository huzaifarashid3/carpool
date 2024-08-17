import 'dart:async';
import 'dart:math';

import 'package:carpool/Models/ride_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RideState extends ChangeNotifier {
  RideState() {
    _controller.add(dataPipeline(allRides, going: null, leaving: null));
    autoRefresh();
  }

  final _controller = StreamController<List<int>>();

  Stream<List<int>> get fetchCards => _controller.stream;

  bool? going;
  bool? leaving;

  void refresh() {
    _controller.add(dataPipeline(allRides, going: going, leaving: leaving));
  }

  void setGoing(bool? value) {
    going = value;
    refresh();
  }

  void setLeaving(bool? value) {
    leaving = value;
    refresh();
  }

  List<Ride> RIDES = List.generate(
    10,
    (i) {
      int capacity = Random().nextInt(4) + 1;
      int occupied = Random().nextInt(capacity) + 1;
      return Ride(
        name: i % 2 == 0 ? 'Huzaifa Rashid' : 'Ismail Qayyum',
        booked: i < 2,
        contact: '03001234567',
        going: Random().nextInt(4) < 2,
        capacity: capacity,
        occupied: occupied,
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
      );
    },
  );

  void book(int index) async {
    RIDES[index].book();
    refresh();
  }

  void unbook(int index) async {
    RIDES[index].unbook();
    refresh();
  }

  List<int> bookedRides(ridesIndices) {
    return ridesIndices.where((element) => RIDES[element].booked).toList();
  }

  List<int> unbookedRides(ridesIndices) {
    return ridesIndices.where((element) => !RIDES[element].booked).toList();
  }

  List<int> get allRides {
    return List.generate(RIDES.length, (i) => i);
  }

  List<int> arrangeRides(ridesIndices) {
    return [...bookedRides(ridesIndices), ...unbookedRides(ridesIndices)];
  }

  // main isolate implementation
  List<int> filterRides(ridesIndices, {bool? going, bool? leaving}) {
    {
      return ridesIndices
          .where((i) =>
              (going == null || RIDES[i].going == going) &&
              (leaving == null || RIDES[i].going != leaving))
          .toList();
    }
  }

  List<int> dataPipeline(ridesIndices, {bool? going, bool? leaving}) {
    return arrangeRides(
        filterRides(ridesIndices, going: going, leaving: leaving));
  }

  void autoRefresh() {
    Timer.periodic(const Duration(seconds: 5), (t) {
      _controller.add(dataPipeline(allRides, going: going, leaving: leaving));
      print("refreshing");
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  // Isolate implementation
  // Future<void> filterRides({List<int>  bool? going, bool? leaving}) async {
  //   await compute(_filterRides, {'going': going, 'leaving': leaving});
  // }

  // void _filterRides(Map<String, bool?> filters) {
  //   bool? going = filters['going'];
  //   bool? leaving = filters['leaving'];

  //   List<int> filteredRides = RIDES
  //       .asMap()
  //       .entries
  //       .where((element) =>
  //           (going == null || element.value.going == going) &&
  //           (leaving == null || element.value.going != leaving))
  //       .map((e) => e.key)
  //       .toList();
  //   _controller.add(filteredRides);
  // }
// make the network call here

  // Stream<List<int>> tempStream() async* {
  //   await Future.delayed(const Duration(seconds: 5));
  //   yield arrangedRides;
  //   await Future.delayed(const Duration(seconds: 5));
  //   yield arrangedRides;
  //   // await Future.delayed(const Duration(seconds: 2));
  // }

  // RideState() {
  //   fetchCards = tempStream().listen((event) {
  //     print("event");
  //   });
  // }

  // Stream<List<int>> fetchCards() async* {
  //   await Future.delayed(const Duration(seconds: 5));
  //   yield arrangedRides;
  //   await Future.delayed(const Duration(seconds: 5));
  //   yield arrangedRides;
  //   // await Future.delayed(const Duration(seconds: 2));
  // }

// network flow
// 1. fetch data from network
// 2. parse data
// 3. filter data
// 4. arrange data
// 5. display data

// if the ui causes the data to change,
// make the network call to update the data
// if the data is updated, then only cause rebuild
// else show some message that data is not updated
// in meanwhile, show the old data and some indication that data is being updated
}

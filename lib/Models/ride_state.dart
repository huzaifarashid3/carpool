import 'dart:async';
import 'dart:math';

import 'package:carpool/Models/ride_model.dart';
import 'package:flutter/material.dart';

class RideState extends ChangeNotifier {
  final car = const Image(image: AssetImage('assets/car.png'));
  late Stream<List<int>> fetchR;
  List<Ride> rides = List.generate(
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
    rides[index].book();
    _controller.add(arrangedRides);
    // notifyListeners();
  }

  void unbook(int index) async {
    rides[index].unbook();
    _controller.add(arrangedRides);
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

  // void fetch() async {
  //   fetchR = fetchCards();
  // }

  void refresh() {
    // fetch();
    notifyListeners();
  }

  List<int> get allRides {
    List<int> allRides = [];
    for (int i = 0; i < rides.length; i++) {
      allRides.add(i);
    }
    return allRides;
  }

  // wrap this part in an isolate
  List<int> get arrangedRides => [...bookedRides, ...unbookedRides];

  Future<void> fetch() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> filterRides({bool? going, bool? leaving}) async {
    // await Future.delayed(const Duration(seconds: 2));
    List<int> filteredRides = rides
        .asMap()
        .entries
        .where((element) =>
            (going == null || element.value.going == going) &&
            (leaving == null || element.value.going != leaving))
        .map((e) => e.key)
        .toList();
    _controller.add(filteredRides);
  }

// make the network call here

  Stream<List<int>> tempStream() async* {
    await Future.delayed(const Duration(seconds: 5));
    yield arrangedRides;
    await Future.delayed(const Duration(seconds: 5));
    yield arrangedRides;
    // await Future.delayed(const Duration(seconds: 2));
  }

  RideState() {
    // autoRefresh();
    _controller.add(arrangedRides);
  }

  void autoRefresh() {
    Timer.periodic(const Duration(seconds: 5), (t) {
      // make the network call here
      // if new data or data changed, then only cause rebuild
      _controller.add(arrangedRides);
    });
  }

  final _controller = StreamController<List<int>>();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Stream<List<int>> get fetchCards => _controller.stream;

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
}


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

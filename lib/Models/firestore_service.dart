import 'package:carpool/Models/ride_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get
  CollectionReference ref = FirebaseFirestore.instance.collection('Rides');

  // create
  Future<void> addRide(Ride ride) async {
    await ref.add({
      'name': ride.name,
      'booked': ride.booked,
      'contact': ride.contact,
      'going': ride.going,
      'capacity': ride.capacity,
      'occupied': ride.occupied,
      'route': ride.route,
      'vehicleName': ride.vehicleName,
      'vehicleType': ride.vehicleType,
      'departureTime': ride.departureTime,
    });
  }

  // reads
  Future<List<Ride>> fetchRides() async {
    QuerySnapshot snapshot = await ref.get();
    try {
      final rides = snapshot.docs
          .map((doc) => Ride.fromJson(doc.data() as Map<String, dynamic>));
      List<Ride> ridesList = [];
      for (final ride in rides) {
        print(ride.name);
        ridesList.add(ride);
      }
      return ridesList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}

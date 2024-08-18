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
    return snapshot.docs
        .map((doc) => Ride.fromJson(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }

  // update
  Future<void> updateRide(Ride ride) async {
    await ref.doc(ride.id).update({
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
}

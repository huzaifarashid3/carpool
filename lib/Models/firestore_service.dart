import 'package:carpool/Models/ride_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  // get
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Rides');
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

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

  Stream<List<Ride>> getRides() {
    return ref.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Ride.fromJson(doc.id, doc.data() as Map<String, dynamic>))
        .toList());
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

  // notifcations
  Future<void> initNotification() async {
    // await _firebaseMessaging.requestPermission();
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint(fcmToken);
  }

  // handle notifications
}

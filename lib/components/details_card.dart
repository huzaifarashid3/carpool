import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/components/info_card.dart';
import 'package:carpool/components/route_card.dart';
import 'package:carpool/components/seat_card.dart';
import 'package:carpool/components/time_card.dart';
import 'package:carpool/components/vehicle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class DetailsCard extends StatelessWidget {
  final int rideIndex;
  const DetailsCard({
    super.key,
    required this.rideIndex,
  });

  @override
  Widget build(BuildContext context) {
    var rideState = context.read<RideState>();
    final bool booked = rideState.rides[rideIndex].booked;
    final String name = rideState.rides[rideIndex].name;
    final String contact = rideState.rides[rideIndex].contact;
    final List<String> route = rideState.rides[rideIndex].route;
    final int capacity = rideState.rides[rideIndex].capacity;
    final int occupied = rideState.rides[rideIndex].occupied;
    final String vehicleType = rideState.rides[rideIndex].vehicleType;
    final String vehicleName = rideState.rides[rideIndex].vehicleName;
    final String departureTime = rideState.rides[rideIndex].departureTime;
    const Color yellow = Color.fromARGB(221, 210, 194, 54);
    const Color red = Color.fromARGB(221, 210, 54, 54);

    return SizedBox(
      height: 118,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: booked
            ? const Color.fromARGB(255, 231, 227, 197)
            : const Color.fromARGB(255, 238, 238, 238),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              if (booked)
                SlidableAction(
                  onPressed: (context) {
                    rideState.unbook(rideIndex);
                  },
                  backgroundColor: red,
                  foregroundColor: Colors.white,
                  label: 'UNBOOK',
                )
              else
                SlidableAction(
                  // An action can be bigger than the others.
                  onPressed: (context) {
                    rideState.book(rideIndex);
                  },
                  backgroundColor: yellow,
                  foregroundColor: Colors.white,
                  label: 'BOOK',
                ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    RouteCard(route: route),
                    const SizedBox(height: 15),
                    SeatCard(occupied: occupied, capacity: capacity),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoCard(name: name, contact: contact),
                        TimeCard(time: departureTime),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(width: 7),
              VehicleCard(vehicleType: vehicleType, vehicleName: vehicleName),
            ],
          ),
        ),
      ),
    );
  }
}

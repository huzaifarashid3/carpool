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
    final ride = rideState.rides[rideIndex];
    const Color yellow = Color.fromARGB(221, 210, 194, 54);
    const Color red = Color.fromARGB(221, 210, 54, 54);

    return SizedBox(
      height: 118,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: ride.booked
            ? const Color.fromARGB(255, 231, 227, 197)
            : const Color.fromARGB(255, 238, 238, 238),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              if (ride.booked)
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
                    RouteCard(route: ride.route),
                    const SizedBox(height: 15),
                    SeatCard(occupied: ride.occupied, capacity: ride.capacity),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoCard(name: ride.name, contact: ride.contact),
                        TimeCard(time: ride.departureTime),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(width: 7),
              VehicleCard(
                  vehicleType: ride.vehicleType, vehicleName: ride.vehicleName),
            ],
          ),
        ),
      ),
    );
  }
}

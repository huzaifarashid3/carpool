import 'package:carpool/Models/ride_state.dart';
import 'package:carpool/Models/ui_state.dart';
import 'package:carpool/components/info_card.dart';
import 'package:carpool/components/route_card.dart';
import 'package:carpool/components/seat_card.dart';
import 'package:carpool/components/time_card.dart';
import 'package:carpool/components/vehicle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class RideCard extends StatefulWidget {
  final int rideIndex;
  const RideCard({
    super.key,
    required this.rideIndex,
  });

  @override
  State<RideCard> createState() => _RideCardState();
}

class _RideCardState extends State<RideCard> {
  bool isExpanded = false;
  static const Color yellow = Color.fromARGB(221, 210, 194, 54);
  static const red = Color.fromARGB(221, 210, 54, 54);
  @override
  Widget build(BuildContext context) {
    var rideState = context.read<RideState>();
    final ride = rideState.rides[widget.rideIndex];
    final scrollController = context.read<UiState>().scrollController;

    return AnimatedContainer(
      height: isExpanded ? 150 : 118,
      duration: const Duration(milliseconds: 200),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: ride.booked
            ? const Color.fromARGB(255, 231, 227, 197)
            : const Color.fromARGB(255, 238, 238, 238),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: InkWell(
          onTap: () => setState(() {
            isExpanded = !isExpanded;
          }),
          borderRadius: BorderRadius.circular(10),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                if (ride.booked)
                  SlidableAction(
                    onPressed: (context) {
                      rideState.unbook(widget.rideIndex);
                    },
                    backgroundColor: red,
                    foregroundColor: Colors.white,
                    label: 'UNBOOK',
                  )
                else
                  SlidableAction(
                    // An action can be bigger than the others.
                    onPressed: (context) {
                      rideState.book(widget.rideIndex);
                      scrollController.hasClients
                          ? scrollController.animateTo(
                              scrollController.position.minScrollExtent,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            )
                          : null;
                    },
                    backgroundColor: yellow,
                    foregroundColor: Colors.white,
                    label: 'BOOK',
                  ),
              ],
            ),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    rideState.unbook(widget.rideIndex);
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.call,
                )
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
                      SeatCard(
                          occupied: ride.occupied, capacity: ride.capacity),
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
                  vehicleType: ride.vehicleType,
                  vehicleName: ride.vehicleName,
                  going: ride.going,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

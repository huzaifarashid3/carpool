// ignore_for_file: sort_child_properties_last, prefer_const_constructors, non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class list_tile extends StatelessWidget {
  final String time, name, owner_name, type;
  final int capacity;
  final bool going_fast;

  const list_tile(
      {Key? key,
      required this.time,
      required this.name,
      required this.owner_name,
      required this.type,
      required this.going_fast,
      required this.capacity});

  static const Color tile_colour1 = Color.fromARGB(255, 145, 255, 2);
  static const Color tile_colour2 = Color.fromARGB(255, 255, 213, 2);
  static const Color seat_filled_colour = Color.fromARGB(255, 9, 140, 150);
  static const Color vacant_seat_colour = Color.fromARGB(255, 148, 147, 149);
  //
  @override
  Widget build(BuildContext context) {
    List<String> route2_stops = ['Kda', 'North', 'Nipa', 'Millenium', 'Fast'];
    if (type == 'car') {
      return Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              // Implement your logic here
              // You can use add_a_stop_controller.text
              // create_route.route1_stops.add(add_a_stop_controller.text);
              // create_route.rout
            },
            icon: Icons.call,
            label: 'Call',
            backgroundColor: Colors.green,
          ),
        ]),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              // Implement your logic here
              // You can use add_a_stop_controller.text
              // create_route.route1_stops.add(add_a_stop_controller.text);
              // create_route.rout
            },
            icon: Icons.collections,
            label: 'Book Seat',
            backgroundColor: Color.fromARGB(255, 5, 225, 241),
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: tile_colour1,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListTile(
            //isThreeLine: true,
            visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            title: Row(
              children: [
                // OWNER NAME CONTAINER
                Container(width: 300, child: Text(owner_name)),
                // const SizedBox(
                //   width: 190,
                // ),
                type == 'car' && going_fast == true
                    ? Row(
                        children: [
                          Transform(
                            transform: Matrix4.rotationY(3.14),
                            child: const Text(
                              '🚙 ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const Icon(Icons.apartment)
                        ],
                      )
                    : type == 'car' && going_fast == false
                        ? const Row(
                            children: [
                              Text(
                                '🚙',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.apartment)
                            ],
                          )
                        : Text('error'),
              ],
            ), //Username here
            titleTextStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
            subtitle: Column(
              children: [
                SizedBox(
                  height: 8,
                ),

                //Routes on cards
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                      itemCount: route2_stops.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: 70,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0, 5, 3, 0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 1, 164, 107),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                route2_stops[index],
                                style: TextStyle(color: Colors.white),
                              ),

                              //backgroundColor: Colors.blue,
                            ),
                            index == route2_stops.length - 1
                                ? Container()
                                : Icon(Icons.arrow_right_alt)
                          ],
                        );
                      }),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      //container holding ride color codes
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: const Color.fromARGB(64, 141, 137, 132),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: Row(
                        children: [
                          Tooltip(
                            waitDuration: Duration.zero,
                            message: 'Male Seat Booked !',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: capacity < 4
                                    ? seat_filled_colour
                                    : vacant_seat_colour,
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Tooltip(
                            waitDuration: Duration.zero,
                            message: 'Male Seat Booked !',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: capacity < 3
                                    ? seat_filled_colour
                                    : vacant_seat_colour,
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Tooltip(
                            waitDuration: Duration.zero,
                            message: 'Female Seat Booked !',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: capacity < 2
                                    ? seat_filled_colour
                                    : vacant_seat_colour,
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Tooltip(
                            waitDuration: Duration.zero,
                            message: 'Vacant Seat',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: capacity < 1
                                    ? seat_filled_colour
                                    : vacant_seat_colour,
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 65, 65, 64),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        margin: EdgeInsets.fromLTRB(184, 10, 0, 0),
                        child: Text(
                          time,
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ],
            ), //Ride details

            onTap: () {
              // Logic when tile is clicked
              print('Tile clicked');
            },
          ),
        ),
      );
    } else if (type == 'bike') {
      return Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              // Implement your logic here
              // You can use add_a_stop_controller.text
              // create_route.route1_stops.add(add_a_stop_controller.text);
              // create_route.rout
            },
            icon: Icons.call,
            label: 'Call',
            backgroundColor: Colors.green,
          ),
        ]),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              // Implement your logic here
              // You can use add_a_stop_controller.text
              // create_route.route1_stops.add(add_a_stop_controller.text);
              // create_route.rout
            },
            icon: Icons.collections,
            label: 'Book Seat',
            backgroundColor: Color.fromARGB(255, 5, 225, 241),
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: tile_colour2,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListTile(
            //isThreeLine: true,
            visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
            contentPadding: const EdgeInsets.all(10),
            title: Row(
              children: [
                //OWNERR NAME CONTAINER
                Container(width: 300, child: Text(owner_name)),
                type == 'bike' && going_fast == true
                    ? Row(
                        children: [
                          Transform(
                            transform: Matrix4.rotationY(3.14),
                            child: const Text(
                              '🏍️',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const Icon(Icons.apartment)
                        ],
                      )
                    : type == 'bike' && going_fast == false
                        ? const Row(
                            children: [
                              Text(
                                '🏍️',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.apartment)
                            ],
                          )
                        : Text('error'),
              ],
            ),
            //Username here
            titleTextStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  //Routes on cards
                  height: 30,
                  child: ListView.builder(
                      itemCount: route2_stops.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: 70,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0, 5, 3, 0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 1, 164, 107),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                route2_stops[index],
                                style: TextStyle(color: Colors.white),
                              ),

                              //backgroundColor: Colors.blue,
                            ),
                            index == route2_stops.length - 1
                                ? Container()
                                : Icon(Icons.arrow_right_alt)
                          ],
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //container holding ride color codes
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: const Color.fromARGB(64, 141, 137, 132),
                      ),
                      padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                      child: Row(
                        children: [
                          Tooltip(
                            waitDuration: Duration.zero,
                            message: 'Vacant Seat',
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: capacity < 1
                                    ? seat_filled_colour
                                    : vacant_seat_colour,
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // CODE TO ADD TIME TO THE TILE
                    Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 65, 65, 64),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        margin: EdgeInsets.fromLTRB(268, 10, 0, 0),
                        child: Text(
                          time,
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ), //Ride details

            onTap: () {
              // Logic when tile is clicked
              print('Tile clicked');
            },
            splashColor: Color.fromARGB(255, 0, 255, 123),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

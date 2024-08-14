// ignore_for_file: sort_child_properties_last, prefer_const_constructors, non_constant_identifier_names, constant_identifier_names, deprecated_member_use

import 'package:carpool/notification_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class list_tile extends StatefulWidget {
  final String time, name, owner_name, type;
  final int capacity;
  final bool going_fast;
  final List route;
  final String rider_id;
  final String rider_number;
  list_tile(
      {Key? key,
      required this.time,
      required this.name,
      required this.owner_name,
      required this.type,
      required this.going_fast,
      required this.capacity,
      required this.route,
      required this.rider_id,
      required this.rider_number});

  static const Color tile_colour1 =
      Color.fromARGB(195, 255, 255, 255); // Color.fromARGB(200, 224, 95, 89);

  static const Color tile_colour2 =
      Color.fromARGB(195, 255, 255, 255); //.fromARGB(190, 26, 203, 160);
  static const Color seat_filled_colour = Color.fromARGB(255, 9, 140, 150);
  static const Color vacant_seat_colour = Color.fromARGB(255, 148, 147, 149);

  @override
  State<list_tile> createState() => _list_tileState();
}

class _list_tileState extends State<list_tile> {
  Color name_color_tile1 = Colors.black;

  Color name_color_tile2 = Colors.black;

  //

  @override
  Widget build(BuildContext context) {
    //List<String> route2_stops = ['Kda', 'North', 'Nipa', 'Millenium', 'Fast'];
    if (widget.type == 'car') {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          shadowColor: Colors.black,
          color: list_tile.tile_colour1,
          borderRadius: BorderRadius.circular(15),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: Slidable(
            startActionPane:
                ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  print(
                      'Car rider id and number is ${widget.rider_id} and ${widget.rider_number}');

                  String message =
                      "Hello, I saw your post on Fast Carpool App. Can you book a seat for me ? "; // Replace with your message
                  openWhatsApp(widget.rider_number, message);
                },
                icon: Icons.call,
                label: 'Call',
                backgroundColor: Colors.green,
              ),
            ]),
            endActionPane: ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  // BOOKING SEAT LOGIC

                  FirebaseFirestore.instance
                      .collection('Rides')
                      .where('owner_id', isEqualTo: widget.rider_id)
                      .get()
                      .then((QuerySnapshot snapshot) {
                    if (snapshot.docs.isNotEmpty) {
                      DocumentSnapshot rideDoc = snapshot.docs.first;
                      if (widget.capacity > 0) {
                        rideDoc.reference
                            .update({'capacity': widget.capacity - 1});
                      }
                    }
                  });
                },
                icon: Icons.collections,
                label: 'Book Seat',
                backgroundColor: Color.fromARGB(255, 5, 225, 241),
                //Color.fromARGB(255, 5, 225, 241),
              ),
            ]),
            child: ListTile(
              //isThreeLine: true,

              visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              onTap: () {},
              title: Row(
                children: [
                  // OWNER NAME CONTAINER
                  Expanded(
                      flex: 1,
                      child: Text(
                        widget.owner_name,
                        style: TextStyle(color: name_color_tile1),
                      )),

                  widget.type == 'car' && widget.going_fast == true
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
                      : widget.type == 'car' && widget.going_fast == false
                          ? const Row(
                              children: [
                                Text(
                                  '🚙',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.apartment,
                                )
                              ],
                            )
                          : Text('error'),
                ],
              ), //Username here
              titleTextStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              subtitle: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),

                  //Routes on cards
                  Container(
                    //color: Colors.amber,
                    child: SizedBox(
                      height: 30,
                      child: ListView.builder(
                          itemCount: widget.route.length,
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
                                    widget.route[index],
                                    style: TextStyle(color: Colors.white),
                                  ),

                                  //backgroundColor: Colors.blue,
                                ),
                                index == widget.route.length - 1
                                    ? Container()
                                    : Icon(Icons.arrow_right_alt)
                              ],
                            );
                          }),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          // height: 50,
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
                                  color: widget.capacity < 4
                                      ? list_tile.seat_filled_colour
                                      : list_tile.vacant_seat_colour,
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
                                  color: widget.capacity < 3
                                      ? list_tile.seat_filled_colour
                                      : list_tile.vacant_seat_colour,
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
                                  color: widget.capacity < 2
                                      ? list_tile.seat_filled_colour
                                      : list_tile.vacant_seat_colour,
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
                                  color: widget.capacity < 1
                                      ? list_tile.seat_filled_colour
                                      : list_tile.vacant_seat_colour,
                                ),
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 65, 65, 64),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                margin: EdgeInsets.fromLTRB(183, 10, 0, 0),
                                child: Text(
                                  widget.time,
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ), //Ride details
            ),
          ),
        ),
      );
    } else if (widget.type == 'bike') {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: list_tile.tile_colour2,
          borderRadius: BorderRadius.circular(15),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: Slidable(
            startActionPane:
                ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  print('Rider ID: ${widget.rider_id}');
                  print('Rider number: ${widget.rider_number}');

                  String message =
                      "Hello, I saw your post on Fast Carpool App. Can you book a seat for me ? "; // Replace with your message
                  openWhatsApp(widget.rider_number, message);
                },
                icon: Icons.call,
                label: 'Call',
                backgroundColor: Colors.green,
              ),
            ]),
            endActionPane: ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  FirebaseFirestore.instance
                      .collection('Rides')
                      .where('owner_id', isEqualTo: widget.rider_id)
                      .get()
                      .then((QuerySnapshot snapshot) {
                    if (snapshot.docs.isNotEmpty) {
                      DocumentSnapshot rideDoc = snapshot.docs.first;
                      if (widget.capacity > 0) {
                        rideDoc.reference
                            .update({'capacity': widget.capacity - 1});
                      }
                    }
                  });
                },
                icon: Icons.collections,
                label: 'Book Seat',
                backgroundColor: Color.fromARGB(255, 5, 225, 241),
              ),
            ]),
            child: ListTile(
              //isThreeLine: true,
              visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
              contentPadding: const EdgeInsets.all(10),
              title: Row(
                children: [
                  //OWNERR NAME CONTAINER
                  Expanded(
                      flex: 1,
                      child: Text(
                        widget.owner_name,
                        style: TextStyle(
                          color: name_color_tile2,
                          fontFamily: 'Poppins',
                        ),
                      )),
                  widget.type == 'bike' && widget.going_fast == true
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
                      : widget.type == 'bike' && widget.going_fast == false
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
                        itemCount: widget.route.length,
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
                                  widget.route[index],
                                  style: TextStyle(color: Colors.white),
                                ),

                                //backgroundColor: Colors.blue,
                              ),
                              index == widget.route.length - 1
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: widget.capacity < 1
                                      ? list_tile.seat_filled_colour
                                      : list_tile.vacant_seat_colour,
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
                            widget.time,
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )
                ],
              ), //Ride details

              onTap: () {
                // tile clicked
              },
              splashColor: Color.fromARGB(255, 0, 255, 123),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> openWhatsApp(String phoneNumber, String message) async {
    final url =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

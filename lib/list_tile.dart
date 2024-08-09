// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class list_tile extends StatelessWidget {
  final String time, name, owner_name, type;
  //final int seats;
  final bool going_fast;

  const list_tile(
      {super.key,
      required this.time,
      required this.name,
      required this.owner_name,
      required this.type,
      required this.going_fast});

  @override
  Widget build(BuildContext context) {
    List<String> route2_stops = ['Kda', 'North', 'Nipa', 'Millenium', 'Fast'];
    if (type == 'car') {
      return ListTile(
        //isThreeLine: true,
        visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        title: Row(
          children: [
            Text(owner_name),
            const SizedBox(
              width: 190,
            ),
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
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
        subtitle: Column(
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
                        Icon(Icons.arrow_right_alt)
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
                    color: const Color.fromARGB(64, 141, 137, 132),
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
                            color: const Color.fromARGB(255, 9, 140, 150),
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
                            color: const Color.fromARGB(255, 9, 140, 150),
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
                            color: const Color.fromARGB(255, 9, 140, 150),
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
                            color: const Color.fromARGB(255, 126, 120, 127),
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
                    margin: EdgeInsets.fromLTRB(185, 10, 0, 0),
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
      );
    } else if (type == 'bike') {
      return ListTile(
        //isThreeLine: true,
        visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
        contentPadding: const EdgeInsets.all(10),
        // leading: type == 'car'
        //     ? const Icon(Icons.directions_car)
        //     : const Icon(Icons.motorcycle_rounded),
        title: Row(
          children: [
            Text(owner_name),
            type == 'bike' && going_fast == true
                ? Container(
                    margin: EdgeInsets.fromLTRB(198, 0, 0, 0),
                    child: Row(
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
                    ),
                  )
                : type == 'bike' && going_fast == false
                    ? Container(
                        margin: EdgeInsets.fromLTRB(285, 0, 0, 0),
                        child: const Row(
                          children: [
                            Text(
                              '🏍️',
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.apartment)
                          ],
                        ),
                      )
                    : Text('error'),
          ],
        ),
        //Username here
        titleTextStyle: const TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
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
                        Icon(Icons.arrow_right_alt)
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
                    color: const Color.fromARGB(64, 141, 137, 132),
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
                            color: const Color.fromARGB(255, 126, 120, 127),
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
      );
    } else {
      return Container();
    }
  }
}

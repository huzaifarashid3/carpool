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
    if (type == 'car') {
      return ListTile(
        //isThreeLine: true,
        visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
        contentPadding: const EdgeInsets.all(10),
        leading: type == 'car'
            ? const Icon(Icons.directions_car)
            : const Icon(Icons.motorcycle_rounded),
        title: Text(owner_name), //Username here
        titleTextStyle: const TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Time:'),
                Text(time),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //container holding ride color codes
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(64, 141, 137, 132),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    children: [
                      Tooltip(
                        waitDuration: Duration.zero,
                        message: 'Male Seat Booked !',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
                            borderRadius: BorderRadius.circular(7),
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
                            borderRadius: BorderRadius.circular(7),
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
                            borderRadius: BorderRadius.circular(7),
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
              ],
            )
          ],
        ), //Ride details
        trailing: Column(
          children: [
            //Text('Corolla 2020'),//////
            const Icon(Icons.apartment),
            Tooltip(
              message: 'Going Fast',
              waitDuration: Duration.zero,
              child: Icon(
                going_fast ? Icons.arrow_upward : Icons.arrow_downward,
                weight: 3,
                color: going_fast
                    ? const Color.fromARGB(255, 74, 181, 21)
                    : Colors.red,
              ),
            ),
          ],
        ), //Seats available , Car model

        onTap: () {
          // Logic when tile is clicked
          print('Tile clicked');
        },
        splashColor: const Color.fromARGB(255, 255, 204, 0),
      );
    } else if (type == 'bike') {
      return ListTile(
        //isThreeLine: true,
        visualDensity: const VisualDensity(horizontal: 4, vertical: 3),
        contentPadding: const EdgeInsets.all(10),
        leading: type == 'car'
            ? const Icon(Icons.directions_car)
            : const Icon(Icons.motorcycle_rounded),
        title: Text(owner_name), //Username here
        titleTextStyle: const TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Time:'),
                Text(time),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //container holding ride color codes
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(64, 141, 137, 132),
                  ),
                  padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                  child: Row(
                    children: [
                      Tooltip(
                        waitDuration: Duration.zero,
                        message: 'Vacant Seat',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
              ],
            )
          ],
        ), //Ride details
        trailing: Column(
          children: [
            //Text('Corolla 2020'),//////
            const Icon(Icons.apartment),
            Tooltip(
              message: 'Going Fast',
              waitDuration: Duration.zero,
              child: Icon(
                going_fast ? Icons.arrow_upward : Icons.arrow_downward,
                weight: 3,
                color: going_fast
                    ? const Color.fromARGB(255, 74, 181, 21)
                    : Colors.red,
              ),
            ),
          ],
        ), //Seats available , Car model

        onTap: () {
          // Logic when tile is clicked
          print('Tile clicked');
        },
        splashColor: const Color.fromARGB(255, 255, 204, 0),
      );
    } else {
      return Container();
    }
  }
}

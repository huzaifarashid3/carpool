// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:carpool/dialouges/add_route_stop.dart';
import 'package:flutter/material.dart';

class create_route extends StatefulWidget {
  create_route({super.key});
  static const route_name = 'create_route';
  @override
  State<create_route> createState() => _create_routeState();
}

class _create_routeState extends State<create_route> {
  TextEditingController add_a_stop_controller = TextEditingController();
  TextEditingController route_name_controller = TextEditingController();
  void manage_routes(int number, String value) {}

  static String route1name = 'Gulshan wala',
      route2name = 'Karsaz wala rasta ',
      route3name = 'Johar wala',
      route4name = 'Airport wala';
  static List<String> route1_stops = [
    'Gulshan wala',
    'Gulberg',
    'Model Town',
    'DHA',
    'Johar Town'
  ];
  List<String> route2_stops = ['Kda', 'Nagan', 'Nipa', 'Millenium', 'Fast'];
  List<String> route3_stops = ['Johar', 'Fast'];
  List<String> route4_stops = [
    'Fast',
    'Malir',
    'Airport',
  ];
  late int route1count = route1_stops.length;
  late int route2count = route2_stops.length;
  late int route3count = route3_stops.length;
  late int route4count = route4_stops.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Routes'),
          backgroundColor: const Color.fromARGB(190, 3, 255, 142),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 222, 222),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Route 1:'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Route Name: ',
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            route1name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return edit_route_name_dialog(
                                          1); // Add A STOP
                                    });
                              },
                              child: Text('Edit Route Name')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: route1count,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(10, 5, 3, 0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 164, 107),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  route1_stops[index],
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return add_route_stop(1); // Add A STOP
                                });
                          },
                          icon: Icon(Icons.add,
                              color: Color.fromARGB(255, 87, 4, 160))),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (route1count >= 1) {
                                route1count--;
                                route1_stops.removeLast();
                              }
                            });
                          },
                          icon: Icon(Icons.remove,
                              color: Color.fromARGB(255, 87, 4, 160))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 222, 222),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Route 2:'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Route Name: ',
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            route2name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return edit_route_name_dialog(
                                          2); // Add A STOP
                                    });
                              },
                              child: Text('Edit Route Name')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: route2count,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(10, 5, 3, 0),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return add_route_stop(2); // Add A STOP
                                });
                          },
                          icon: Icon(Icons.add,
                              color: Color.fromARGB(255, 87, 4, 160))),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (route2count >= 1) {
                                route2count--;
                                route2_stops.removeLast();
                              }
                            });
                          },
                          icon: Icon(Icons.remove,
                              color: Color.fromARGB(255, 87, 4, 160))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 222, 222),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Route 3:'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Route Name: ',
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            route3name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return edit_route_name_dialog(
                                          3); // Add A STOP
                                    });
                              },
                              child: Text('Edit Route Name')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: route3count,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(10, 5, 3, 0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 164, 107),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  route3_stops[index],
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return add_route_stop(3); // Add A STOP
                                });
                          },
                          icon: Icon(Icons.add,
                              color: Color.fromARGB(255, 87, 4, 160))),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (route3count >= 1) {
                                route3count--;
                                route3_stops.removeLast();
                              }
                            });
                          },
                          icon: Icon(Icons.remove,
                              color: Color.fromARGB(255, 87, 4, 160))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 222, 222),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Route 4:'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Route Name: ',
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            route4name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return edit_route_name_dialog(
                                          4); // Add A STOP
                                    });
                              },
                              child: Text('Edit Route Name')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: route4count,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(10, 5, 3, 0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 164, 107),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  route4_stops[index],
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return add_route_stop(4); // Add A STOP
                                });
                          },
                          icon: Icon(Icons.add,
                              color: Color.fromARGB(255, 87, 4, 160))),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (route4count >= 1) {
                                route4count--;
                                route4_stops.removeLast();
                              }
                            });
                          },
                          icon: Icon(Icons.remove,
                              color: Color.fromARGB(255, 87, 4, 160))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget add_route_stop(int number) {
    return AlertDialog(
      title: const Text('Add a Stop'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //const Text('Enter the stop name: '),
          const SizedBox(height: 10),
          TextField(
            controller: add_a_stop_controller,
            decoration: InputDecoration(
              hintText: 'Stop Name',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            //Add Stop Button
            onPressed: () {
              setState(() {
                if (add_a_stop_controller.text.isNotEmpty) {
                  switch (number) {
                    case 1:
                      route1_stops.add(add_a_stop_controller.text);
                      route1count = route1_stops.length;
                      Navigator.of(context).pop();
                      return;
                    case 2:
                      route2_stops.add(add_a_stop_controller.text);
                      route2count = route2_stops.length;
                      Navigator.of(context).pop();
                      return;
                    case 3:
                      route3_stops.add(add_a_stop_controller.text);
                      route3count = route3_stops.length;
                      Navigator.of(context).pop();
                      return;
                    case 4:
                      route4_stops.add(add_a_stop_controller.text);
                      route4count = route4_stops.length;
                      Navigator.of(context).pop();
                      return;

                    default:
                  }
                }
              });
            },
            child: const Text('Add Stop'),
          ),
        ],
      ),
    );
  }

  Widget edit_route_name_dialog(int number) {
    return AlertDialog(
      title: const Text('Edit Route Name'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //const Text('Enter the stop name: '),
          const SizedBox(height: 10),
          TextField(
            controller: route_name_controller,
            decoration: InputDecoration(
              hintText: 'Route Name',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            //Add Stop Button
            onPressed: () {
              setState(() {
                if (route_name_controller.text.isNotEmpty) {
                  switch (number) {
                    case 1:
                      route1name = route_name_controller.text;
                      Navigator.of(context).pop();
                      return;
                    case 2:
                      route2name = route_name_controller.text;
                      Navigator.of(context).pop();

                      return;
                    case 3:
                      route3name = route_name_controller.text;
                      Navigator.of(context).pop();

                      return;
                    case 4:
                      route4name = route_name_controller.text;
                      Navigator.of(context).pop();
                      return;

                    default:
                  }
                }
              });
            },
            child: const Text('Set Route Name'),
          ),
        ],
      ),
    );
  }
}

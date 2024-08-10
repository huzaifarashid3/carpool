// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, prefer_const_literals_to_create_immutables, sort_child_properties_last, constant_identifier_names

import 'package:carpool/dialouges/add_route_stop.dart';
import 'package:carpool/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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

  static String route1name = '',
      route2name = '',
      route3name = '',
      route4name = '';
  static List<String> route1_stops = [];
  List<String> route2_stops = [];
  List<String> route3_stops = [];
  List<String> route4_stops = [];
  late int route1count = route1_stops.length;
  late int route2count = route2_stops.length;
  late int route3count = route3_stops.length;
  late int route4count = route4_stops.length;

  @override
  void initState() {
    super.initState();
    read_route_names();
    read_route_stops();
  }

  @override
  Widget build(BuildContext context) {
    // read_route_names();
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Create Routes'),
              SizedBox(
                width: 70,
              ),
            ],
          ),
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

                  // ROUTE STOPS
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: route1_stops.length,
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
                              index == route1_stops.length - 1
                                  ? Container()
                                  : Icon(Icons.arrow_right_alt)
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
                              if (route1_stops.isNotEmpty) {
                                route1_stops.removeLast();
                                update_route_stops(1, route1_stops);
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

                  // ROUTE STOPS
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: route2_stops.length,
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
                              index == route2_stops.length - 1
                                  ? Container()
                                  : Icon(Icons.arrow_right_alt)
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
                              if (route2_stops.isNotEmpty) {
                                route2count--;
                                route2_stops.removeLast();
                                update_route_stops(2, route2_stops);
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
                        itemCount: route3_stops.length,
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
                              index == route3_stops.length - 1
                                  ? Container()
                                  : Icon(Icons.arrow_right_alt)
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
                              if (route3_stops.isNotEmpty) {
                                route3_stops.removeLast();
                                update_route_stops(3, route3_stops);
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
                        itemCount: route4_stops.length,
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
                              index == route4_stops.length - 1
                                  ? Container()
                                  : Icon(Icons.arrow_right_alt)
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
                              if (route4_stops.isNotEmpty) {
                                route4_stops.removeLast();
                                update_route_stops(4, route4_stops);
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

  void remove_route_stop(int number) {
    switch (number) {
      case 1:
        if (route1_stops.isNotEmpty) {
          route1_stops.removeLast();
          update_route_stops(1, route1_stops);
        }
        Navigator.of(context).pop();
        return;
      case 2:
        if (route2_stops.isNotEmpty) {
          route2_stops.removeLast();
          update_route_stops(2, route2_stops);
        }
        Navigator.of(context).pop();
        return;
      case 3:
        if (route3_stops.isNotEmpty) {
          route3_stops.removeLast();
          update_route_stops(3, route3_stops);
        }
        Navigator.of(context).pop();
        return;
      case 4:
        if (route4_stops.isNotEmpty) {
          route4_stops.removeLast();
          update_route_stops(4, route4_stops);
        }

        return;
      default:
    }
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
                      update_route_stops(1, route1_stops);
                      Navigator.of(context).pop();
                      return;
                    case 2:
                      route2_stops.add(add_a_stop_controller.text);
                      update_route_stops(2, route2_stops);
                      Navigator.of(context).pop();
                      return;
                    case 3:
                      route3_stops.add(add_a_stop_controller.text);
                      update_route_stops(3, route3_stops);
                      Navigator.of(context).pop();
                      return;
                    case 4:
                      route4_stops.add(add_a_stop_controller.text);
                      update_route_stops(4, route4_stops);
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
              update_route_name(number, route_name_controller.text);
            },
            child: const Text('Set Route Name'),
          ),
        ],
      ),
    );
  }

  void update_route_stops(int routenumber, List<String> newstops) {
    switch (routenumber) {
      case 1:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route1stops': newstops}).then((_) {
          print('Stops updated successfully');
        }).catchError((error) {
          print('Error updating stops: $error');
        });
        break;

      case 2:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route2stops': newstops}).then((_) {
          print('Stops updated successfully');
        }).catchError((error) {
          print('Error updating stops: $error');
        });
        break;

      case 3:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route3stops': newstops}).then((_) {
          print('Stops updated successfully');
        }).catchError((error) {
          print('Error updating stops: $error');
        });
        break;

      case 4:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route4stops': newstops}).then((_) {
          print('Stops updated successfully');
        }).catchError((error) {
          print('Error updating stops: $error');
        });

        break;
      default:
    }
  }

  void update_route_name(int routenumber, String newname) {
    switch (routenumber) {
      case 1:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route1name': newname}).then((_) {
          print('Name updated successfully');
        }).catchError((error) {
          print('Error updating name: $error');
        });
        break;

      case 2:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route2name': newname}).then((_) {
          print('Name updated successfully');
        }).catchError((error) {
          print('Error updating name: $error');
        });
        break;

      case 3:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route3name': newname}).then((_) {
          print('Name updated successfully');
        }).catchError((error) {
          print('Error updating name: $error');
        });
        break;

      case 4:
        FirebaseFirestore.instance
            .collection('User')
            .doc(login.userLoginID)
            .update({'route4name': newname}).then((_) {
          print('Name updated successfully');
        }).catchError((error) {
          print('Error updating name: $error');
        });

        break;
      default:
    }
  }

  void read_route_names() {
    FirebaseFirestore.instance
        .collection('User')
        .doc(login.userLoginID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          route1name =
              (documentSnapshot.data() as Map<String, dynamic>)['route1name'];
          route2name =
              (documentSnapshot.data() as Map<String, dynamic>)['route2name'];
          route3name =
              (documentSnapshot.data() as Map<String, dynamic>)['route3name'];
          route4name =
              (documentSnapshot.data() as Map<String, dynamic>)['route4name'];
        });
        print('Route names Read successfully');
        print(route1name);
      } else {
        print('Document does not exist on the database');
      }
    }).catchError((error) {
      print('Error reading route names: $error');
    });
  }

  void read_route_stops() {
    FirebaseFirestore.instance
        .collection('User')
        .doc(login.userLoginID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          route1_stops = List<String>.from(
              (documentSnapshot.data() as Map<String, dynamic>)['route1stops']);
          route2_stops = List<String>.from(
              (documentSnapshot.data() as Map<String, dynamic>)['route2stops']);
          route3_stops = List<String>.from(
              (documentSnapshot.data() as Map<String, dynamic>)['route3stops']);
          route4_stops = List<String>.from(
              (documentSnapshot.data() as Map<String, dynamic>)['route4stops']);
        });
        print('Route stops Read successfully');
        print(route1_stops);
        print(route2_stops);
        print(route3_stops);
        print(route4_stops);
      } else {
        print('Document does not exist on the database');
      }
    }).catchError((error) {
      print('Error reading route stops: $error');
    });
  }

  void set_item_counts() {
    setState(() {
      route1count = route1_stops.length;
      route2count = route2_stops.length;
      route3count = route3_stops.length;
      route4count = route4_stops.length;
    });
  }
}

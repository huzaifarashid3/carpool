// ignore_for_file: non_constant_identifier_names, camel_case_types, sort_child_properties_last

import 'package:carpool/bug_report.dart';
import 'package:carpool/dialouges/post_ride.dart';
import 'package:carpool/home_page.dart';
import 'package:carpool/main.dart';
import 'package:carpool/notification_services.dart';
import 'package:carpool/profile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class notification_screen extends StatefulWidget {
  static const route_name = 'notification_screen';
  static const Color backgorund_color =
      const Color.fromARGB(255, 193, 191, 191);

  notification_screen({super.key});

  @override
  State<notification_screen> createState() => _notification_screenState();
}

class _notification_screenState extends State<notification_screen> {
  static bool isSwitched = false;
  bool gf = false, lf = false;
  bool filter_ride = false;
  String filter_dropdown_text = 'Select Departure type';
  @override
  void initState() {
    super.initState();
    NotificationServices().requestNotificationPermission();
    NotificationServices().firebaseInit(context);
    NotificationServices().getDeviceToken().then((value) {
      // print('New Device Tokem:');
      // print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    // print('nigga');
    var noOfRides = 0;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: notification_screen.backgorund_color,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const Expanded(
                child: Text('Fast Carpool',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    )),
              ),
              isSwitched == true
                  ? Row(
                      children: [
                        const Text('Filter: '),
                        SizedBox(
                          width: 35,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  Cards.filtered_going_fast = null;
                                  Cards.filter_ride = true;
                                  isSwitched = false;
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
          //     elevation: 5,
          // centerTitle: true,
        ),
        backgroundColor: notification_screen.backgorund_color,
        body: Stack(
          children: [
            TabBarView(
              children: <Widget>[
                Cards(noOfRides: noOfRides),
                const bug_report(),
                const profile(),
              ],
            ),
          ],
        ),

        //FLOATING ACTION BUTTON
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          distance: 80.0,
          children: [
            FloatingActionButton.small(
              // shape: const CircleBorder(),
              heroTag: null,
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context, builder: (context) => const post_ride());
              },
            ),
            FloatingActionButton.small(
              // shape: const CircleBorder(),
              heroTag: null,
              child: const Icon(Icons.filter_list),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FittedBox(
                      fit: BoxFit.contain,
                      child: AlertDialog(
                        title: const Text('Filter Rides'),
                        content: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 8,
                                  height: 80,
                                ),
                                DropdownButton(
                                  hint: Text(filter_dropdown_text),
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text('Going Fast'),
                                      value: 'Going Fast',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Leaving Fast'),
                                      value: 'Leaving Fast',
                                    ),
                                  ],
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      if (newValue == 'Going Fast') {
                                        Cards.filtered_going_fast = true;
                                        gf = true;
                                        Cards.filter_ride = true;
                                        isSwitched = true;
                                        filter_dropdown_text = 'Going Fast';
                                      } else if (newValue == 'Leaving Fast') {
                                        Cards.filtered_going_fast = false;
                                        Cards.filter_ride = true;
                                        gf = false;
                                        isSwitched = true;
                                        filter_dropdown_text =
                                            newValue.toString();
                                      } else {
                                        Cards.filtered_going_fast = null;
                                        Cards.filter_ride = true;
                                        isSwitched = false;
                                        filter_dropdown_text = '';
                                      }
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {});

                              Navigator.of(context).pop();
                            },
                            child: const Text('Apply'),
                          ),
                        ],
                      ),
                    );
                  },
                );

                ///  });
              },
            ),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.bug_report),
              text: 'Bug Report',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

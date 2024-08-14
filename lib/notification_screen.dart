import 'package:carpool/bug_report.dart';
import 'package:carpool/dialouges/post_ride.dart';
import 'package:carpool/home_page.dart';
import 'package:carpool/main.dart';
import 'package:carpool/profile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class notification_screen extends StatelessWidget {
  static const route_name = 'notification_screen';
  const notification_screen({super.key});

  @override
  Widget build(BuildContext context) {
    //final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    var noOfRides = 0;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Fast Carpool',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Mv Boli',
              )),
          //     elevation: 5,
          // centerTitle: true,
        ),
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
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          // duration: const Duration(milliseconds: 500),
          // distance: 200.0,
          // type: ExpandableFabType.up,
          // pos: ExpandableFabPos.left,
          // childrenOffset: const Offset(0, 20),
          // childrenAnimation: ExpandableFabAnimation.none,
          // fanAngle: 40,
          // openButtonBuilder: RotateFloatingActionButtonBuilder(
          //   child: const Icon(Icons.abc),
          //   fabSize: ExpandableFabSize.large,
          //   foregroundColor: Colors.amber,
          //   backgroundColor: Colors.green,
          //   shape: const CircleBorder(),
          //   angle: 3.14 * 2,
          // ),
          // closeButtonBuilder: FloatingActionButtonBuilder(
          //   size: 56,
          //   builder: (BuildContext context, void Function()? onPressed,
          //       Animation<double> progress) {
          //     return IconButton(
          //       onPressed: onPressed,
          //       icon: const Icon(
          //         Icons.check_circle_outline,
          //         size: 40,
          //       ),
          //     );
          //   },
          // ),
          overlayStyle: ExpandableFabOverlayStyle(
            color: Colors.black.withOpacity(0.5),
            blur: 5,
          ),
          // onOpen: () {
          //   debugPrint('onOpen');
          // },
          // afterOpen: () {
          //   debugPrint('afterOpen');
          // },
          // onClose: () {
          //   debugPrint('onClose');
          // },
          // afterClose: () {
          //   debugPrint('afterClose');
          // },
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
              onPressed: () {},
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

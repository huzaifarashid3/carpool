import 'package:carpool/Models/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'ui_helpers/ui_helpers.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: UserCard(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'R I D E S',
            style: TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
          ),
          SwipeText(),
        ],
      ),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
    );
  }
}

class CarAnimation extends StatelessWidget {
  const CarAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 60),
          child: Lottie.network(
            'assets/car_animation.json',
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class SwipeText extends StatelessWidget {
  const SwipeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.rtl,
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: const Text(
        'SWIPE TO BOOK',
        style: TextStyle(
          color: Color.fromARGB(255, 116, 116, 116),
          letterSpacing: 4,
        ),
      ),
    );
  }
}

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  bool isEditing = false;
  final style = const TextStyle(
    color: Color.fromARGB(255, 109, 109, 109),
    letterSpacing: 2,
    fontSize: 13,
    // fontWeight: FontWeight.w100,
  );

  @override
  void dispose() {
    nameController.dispose();
    contactController.dispose();
    super.dispose();
  }

  Future<void> saveUser() async {
    final appState = context.read<UserState>();
    appState.updateUser(nameController.text, contactController.text);
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<UserState>();
    if (appState.isUserLoggedIn) {
      nameController.text = appState.name!;
      contactController.text = appState.contact!;
    } else {
      isEditing = true;
    }
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          // first part
                          WidgetSpan(
                            child: Text(
                              isEditing ? "NAME:        " : "WELCOME,  ",
                              style: style,
                            ),
                          ),
                          // flexible text field
                          WidgetSpan(
                              child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(minWidth: 128),
                                  child: IntrinsicWidth(
                                    child: TextField(
                                        inputFormatters: [
                                          UpperCaseTextFormatter()
                                        ],
                                        controller: nameController,
                                        enabled: isEditing,
                                        maxLines: null,
                                        style: style.copyWith(
                                          fontSize: 16,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: const InputDecoration(
                                            isDense: true,
                                            contentPadding: EdgeInsets.all(0))),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          // first part
                          WidgetSpan(
                            child: Text("CONTACT:   ", style: style),
                          ),
                          // flexible text field
                          WidgetSpan(
                              child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(minWidth: 128),
                                  child: IntrinsicWidth(
                                    child: TextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        controller: contactController,
                                        enabled: isEditing,
                                        maxLines: null,
                                        style: style.copyWith(
                                          fontSize: 16,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                            hintText: '03XX1234567',
                                            hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 202, 202, 202),
                                                fontSize: 16),
                                            isDense: true,
                                            contentPadding: EdgeInsets.all(0))),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ],
              )
              // else
              // UserCard(name: widget.name, contact: widget.contact),
            ],
          ),
        ),
        SizedBox(
          height: 30,
          child: OutlinedButton(
            onPressed: () {
              saveUser();
              setState(() {
                isEditing = !isEditing;
              });
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),

              shape: const CircleBorder(),
              // borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              isEditing ? Icons.check : Icons.edit_outlined,
              color: Colors.grey,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}

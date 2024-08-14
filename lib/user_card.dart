import 'package:carpool/Models/user_state.dart';
import 'package:carpool/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
      nameController.text = appState.name ?? "";
      contactController.text = appState.contact ?? "";
    } else {
      isEditing = true;
    }
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                          UpperCaseTextFormatter(),
                                          LengthLimitingTextInputFormatter(20),
                                        ],
                                        controller: nameController,
                                        enabled: isEditing,
                                        maxLines: 1,
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
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(11),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
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
                isEditing ? Icons.check : Icons.person,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

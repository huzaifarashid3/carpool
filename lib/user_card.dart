import 'package:carpool/Models/ui_state.dart';
import 'package:carpool/Models/user_state.dart';
import 'package:carpool/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final style = const TextStyle(
    color: Color.fromARGB(255, 109, 109, 109),
    letterSpacing: 2,
    fontSize: 20,
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
    // print("child building");
    final userState = context.watch<UserState>();
    final uiState = context.watch<UiState>();
    bool isEditing = uiState.isEditing;
    isEditing = true;
    final bool isUserLoggedIn = userState.isUserLoggedIn;
    if (isUserLoggedIn) {
      nameController.text = userState.name ?? "";
      contactController.text = userState.contact ?? "";
    }
    return Column(
      // mainAxisSize: MainAxisSize.min,
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
                    isEditing ? "NAME:         " : "WELCOME,  ",
                    style: style,
                  ),
                ),
                // flexible text field
                WidgetSpan(
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 128),
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
                                fontSize: 20,
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
                        constraints: const BoxConstraints(minWidth: 128),
                        child: IntrinsicWidth(
                          child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),
                              ],
                              controller: contactController,
                              enabled: isEditing,
                              maxLines: null,
                              style: style.copyWith(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w300,
                              ),
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  hintText: '03XX1234567',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      fontSize: 20),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0))),
                        ))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // builder: (BuildContext context) => const UserCard(),
      builder: (BuildContext context) => const SizedBox(
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: UserCard(),
          )),
    );
  }

  // Future<void> saveUser() async {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: OutlinedButton(
        onPressed: () {
          // if (isEditing) saveUser();
          _showModalBottomSheet(context);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),

          shape: const CircleBorder(),
          // borderRadius: BorderRadius.circular(40),
        ),
        child: const Icon(
          Icons.person,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserState with ChangeNotifier {
  String? name;
  String? contact;

  bool get isUserLoggedIn => name != null || contact != null;

  UserState({this.name, this.contact}) {
    loadUserFromLocalStorage();
  }

  void updateUser(String pName, String pContact) async {
    name = pName;
    contact = pContact;
    await saveUserToLocalStorage();
    notifyListeners();
  }

  void updateName(String pName) {
    name = pName;
    notifyListeners();
  }

  void updateContact(String pContact) {
    contact = pContact;
    notifyListeners();
  }

  Future<void> loadUserFromLocalStorage() async {
    debugPrint('Loading user from local storage');
    final prefs = await SharedPreferences.getInstance();
    final pName = prefs.getString('name');
    final pContact = prefs.getString('contact');
    print('Name: $pName, Contact: $pContact');
    if (name != null && contact != null) {
      name = pName;
      contact = pContact;
      notifyListeners();
    }
  }

  Future<void> saveUserToLocalStorage() async {
    debugPrint('Saving user to local storage');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name!);
    prefs.setString('contact', contact!);
  }

  void clearUserFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('contact');
  }
}

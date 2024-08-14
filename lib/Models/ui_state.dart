import 'package:flutter/material.dart';

class UiState extends ChangeNotifier {
  bool isEditing = false;

  void toggleEditing() {
    isEditing = !isEditing;
    notifyListeners();
  }
}

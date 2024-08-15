import 'package:flutter/material.dart';

class UiState extends ChangeNotifier {
  bool isEditing = false;
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void toggleEditing() {
    isEditing = !isEditing;
    notifyListeners();
  }

  int noOfBookedRides = 0;
}

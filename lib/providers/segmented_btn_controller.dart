import 'package:flutter/material.dart';

class SegmentedButtonController extends ChangeNotifier {
  bool maleIsSelected = true;

  toggleSelection(bool value) {
    maleIsSelected = value;
    notifyListeners();
  }
}

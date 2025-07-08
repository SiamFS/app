import 'package:flutter/material.dart';
import '../models/vangti_model.dart';
import '../utils/constants.dart';

class VangtiController extends ChangeNotifier {
  VangtiModel _model = VangtiModel(amount: 0, change: {});

  VangtiModel get model => _model;

  void clear() {
    _model = VangtiModel(amount: 0, change: {});
    notifyListeners();
  }

  void addDigit(int digit) {
    int newAmount = _model.amount * 10 + digit;
    _calculateChange(newAmount);
  }

  void _calculateChange(int amount) {
    Map<int, int> change = {};
    int remainingAmount = amount;

    for (var note in takaNotes) {
      if (remainingAmount >= note) {
        change[note] = remainingAmount ~/ note;
        remainingAmount %= note;
      } else {
        change[note] = 0;
      }
    }

    _model = VangtiModel(amount: amount, change: change);
    notifyListeners();
  }
}

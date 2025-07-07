import 'package:flutter/material.dart';
import '../models/vangti_model.dart';

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
    final notes = [500, 100, 50, 20, 10, 5, 2, 1];
    Map<int, int> change = {};
    int remainingAmount = amount;

    for (var note in notes) {
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

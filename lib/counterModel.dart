import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  //  initial state
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}

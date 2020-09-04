import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void clear() {
    count = 0;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class cartitem with ChangeNotifier {
  int counter = 0;

  increment()
  {
    counter++;
    notifyListeners();
  }
  decrement()
  {
    counter--;
    notifyListeners();
  }
}

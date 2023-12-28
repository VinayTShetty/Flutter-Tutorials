import 'package:flutter/cupertino.dart';

class ColorProvider with ChangeNotifier {
  double _value = 0;
  double get value => _value;

  void setColorValue(double colorSliderValue) {
    _value = colorSliderValue;
    notifyListeners();
  }
}

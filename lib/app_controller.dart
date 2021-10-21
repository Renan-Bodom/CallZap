import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDartTheme = false;
  chargeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}

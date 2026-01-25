// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';


class ThemeChenge extends ChangeNotifier {

  var _themeMode = ThemeMode.system;
ThemeMode get themeMode =>  _themeMode;

void setTheme(ThemeMode themeMode){
  _themeMode = themeMode;
  notifyListeners();

}
}
/*ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.light;

  void toggleTheme(bool isOne){
    themeMode = isOne? ThemeMode.dark : ThemeMode.light; 
    notifyListeners();
  }
}
*/
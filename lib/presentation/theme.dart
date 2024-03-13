import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  final Color _lightThemeColor = Colors.white; 
  final Color _darkThemeColor = Colors.purple; 
  final Icon _iconSunnny=const Icon(Icons.sunny);
  final Icon _iconMoon=const Icon(Icons.nightlight_round_rounded);
  final Color _blackTextColor = Colors.black; 
  final Color _whiteTextColor =  Colors.white; 


  
  
 
 

  bool get isDarkMode => _isDarkMode;
  
  Color get themeChange=>_isDarkMode ? _darkThemeColor : _lightThemeColor;
  Icon get iconChange=>_isDarkMode ? _iconMoon : _iconSunnny;
  Color get textChange=>_isDarkMode ? _whiteTextColor : _blackTextColor;









  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
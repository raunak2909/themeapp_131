import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
class AppThemeProvider extends ChangeNotifier{

  bool isDark = false;

  void updateTheme(bool value){
    isDark = value;
    notifyListeners();
  }

  bool getThemeBoolean(){
    return isDark;
  }


}
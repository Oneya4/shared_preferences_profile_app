import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettings with ChangeNotifier {
  bool isChecked = false;
  bool isRight = false;
  bool isLeft = true;
  bool isTopBottom = false;
  bool loading = false;
  SharedPreferences? _prefs;
  //SharedPreferences is a nullable type in versions ^2.0.5

  //The provider class is initialize at its creation with a call to _restoreSettings() to check for saved values before current processing begins
  ProfileSettings() {
    _restoreSettings();
  }

  _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  _restoreSettings() async {
    await _initPrefs();
    isChecked = _prefs?.getBool('isChecked') ?? false;
    isLeft = _prefs?.getBool('isLeft') ?? true;
    isRight = _prefs?.getBool('isRight') ?? false;
    isTopBottom = _prefs?.getBool('isTopBottom') ?? false;
    notifyListeners();
  }

  _saveSettings() async {
    await _initPrefs();
    _prefs?.setBool('isChecked', isChecked);
    _prefs?.setBool('isLeft', isLeft);
    _prefs?.setBool('isRight', isRight);
    _prefs?.setBool('isTopBottom', isTopBottom);
  }

//function to toggle SwitchTile()
  toggleSwitchTile() async {
    isChecked = !isChecked;
    _saveSettings();
    notifyListeners();
  }

//notifylisteners has to be called after every check to ensure the other values are set to false when one is true.(looking for a better implementation)
  switchPosition(String position) async {
    if (position == 'left') {
      isLeft = !isLeft;
      isRight = false;
      isTopBottom = false;
      _saveSettings();
      notifyListeners();
    } else if (position == 'right') {
      isRight = !isRight;
      isLeft = false;
      isTopBottom = false;
      _saveSettings();
      notifyListeners();
    } else if (position == 'topBottom') {
      isTopBottom = !isTopBottom;
      isRight = false;
      isLeft = false;
      _saveSettings();
      notifyListeners();
    }
  }

  void isLoading() async {
    await Future.delayed(Duration(seconds: 3));
    loading = true;
    notifyListeners();
  }
}

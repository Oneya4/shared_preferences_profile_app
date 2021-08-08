import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettings with ChangeNotifier {
  bool isChecked = false;
  bool isRight = false;
  bool isLeft = true;
  bool isTopBottom = false;
  SharedPreferences? _prefs;

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

  toggleSwitchTile() async {
    isChecked = !isChecked;
    _saveSettings();
    notifyListeners();
  }

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
}

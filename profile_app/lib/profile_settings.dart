import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettings with ChangeNotifier {
  bool isChecked;
  bool isRight;
  bool isLeft;
  bool isTopBottom;

  ProfileSettings({
    this.isChecked = false,
    this.isRight = false,
    this.isLeft = false,
    this.isTopBottom = false,
  });

  void _switchValue(bool newValue) {
    isChecked = newValue;
    notifyListeners();
  }

  void toggleSwitchTile() {
    final newVal = !isChecked;
    notifyListeners();
    _switchValue(newVal);
  }

  void _switchPosition(bool newValue, bool off) {
    isRight = newValue;
    isLeft = off;
    isTopBottom = off;
    notifyListeners();
  }

  void toRight() {
    final newVal = !isRight;
    notifyListeners();
    _switchPosition(newVal, !newVal);
  }

  void toLeft() {
    final newVal = !isLeft;
    notifyListeners();
    _switchPosition(newVal, !newVal);
  }

  void toTopBottom() {
    final newVal = !isTopBottom;
    notifyListeners();
    _switchPosition(newVal, !newVal);
  }
}

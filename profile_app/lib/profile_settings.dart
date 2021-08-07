import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettings with ChangeNotifier {
  bool isChecked;
  bool isRight;
  bool isLeft;
  bool isTopBottom;

  ProfileSettings({
    this.isChecked = false,
    this.isLeft = false,
    this.isRight = false,
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

  void switchPosition(String position) {
    if (position == 'left') {
      isLeft = true;
      isRight = false;
      isTopBottom = false;
      notifyListeners();
    } else if (position == 'right') {
      isRight = true;
      isLeft = false;
      isTopBottom = false;
      notifyListeners();
    } else if (position == 'topBottom') {
      isTopBottom = true;
      isRight = false;
      isLeft = false;
      notifyListeners();
    }
  }

  // void widgetOrientation(String orientation) {
  //   if (orientation == 'topBottom') {
  //     isTopBottom = true;
  //     isRight = false;
  //     isLeft = false;
  //     notifyListeners();
  //   }
  // }
}

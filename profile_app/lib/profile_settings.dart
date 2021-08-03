import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

class ProfileSettings with ChangeNotifier {
  bool isChecked;

  ProfileSettings({
    this.isChecked = false,
  });

  // void showLogo() {
  //   Timer(duration, callback) duration = Duration(seconds: 3);
  //   if(duration> duration.difference)
  // }

  void _setChecked(bool newValue) {
    isChecked = newValue;
    notifyListeners();
  }

  void toggleState() {
    final newVal = !isChecked;
    notifyListeners();
    _setChecked(newVal);
  }
}

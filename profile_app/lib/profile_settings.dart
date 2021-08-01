import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

class ProfileSettings with ChangeNotifier {
  bool isChecked;

  ProfileSettings({
    this.isChecked = false,
  });

  void _setChecked(bool newValue) {
    isChecked = newValue;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class Profile with ChangeNotifier {
  String? firstName = 'Joyce';
  String? secondName = 'Makhaba';
  String? imageUrl =
      'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750';
  Profile({
    @required this.firstName,
    @required this.secondName,
    @required this.imageUrl,
  });
}

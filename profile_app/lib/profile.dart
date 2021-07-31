import 'package:flutter/cupertino.dart';

class Profile with ChangeNotifier {
  final String firstName;
  final String secondName;
  final String imageUrl;

  Profile(this.firstName, this.secondName, this.imageUrl);
}

List<Profile> info = [
  Profile('Diana', 'Nyamai',
      'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750')
];

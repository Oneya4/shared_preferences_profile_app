import 'package:flutter/material.dart';
import './settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Card(
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    foregroundImage: NetworkImage(
                        'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
                  ),
                ),
              ],
            ),
            Text('Diana'),
            Text('Nyamai'),
          ],
        ),
      ),
    );
    //(
    // appBar: AppBar(
    //   title: Text('Profile'),
    //
    // ),
  }
}

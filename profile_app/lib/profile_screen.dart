import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile_settings.dart';
import './settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    //Set up connection to profile_settings.dart, the state manager
    Provider.of<ProfileSettings>(context, listen: false);

    // final ButtonStyle roundEdges = ElevatedButton.styleFrom(
    //   shape: StadiumBorder(),
    // );
    final double left = -0.65;
    final double right = 0.65;
    final double ab = 0;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingsScreen.routeName),
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Card(
        color: Colors.blue,
        child: Column(
          children: [
            Consumer<ProfileSettings>(
              builder: (ctx, setting, _) => Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment(right, ab),
                    child: const CircleAvatar(
                      radius: 93,
                      foregroundImage: NetworkImage(
                          'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(left, ab),
                    child: Text(
                      'Diana \nNyamai',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<ProfileSettings>(
                  builder: (ctx, setting, _) => ButtonBar(
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone),
                        label: Text('Mobile'),
                        style: ElevatedButton.styleFrom(
                          shape: setting.isChecked ? StadiumBorder() : null,
                          primary: Colors.purple,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.mail),
                        label: Text('Mail'),
                        style: ElevatedButton.styleFrom(
                          shape: setting.isChecked ? StadiumBorder() : null,
                          primary: Colors.purple,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

    final ButtonStyle roundEdges = ElevatedButton.styleFrom(
      shape: StadiumBorder(),
    );
    return Scaffold(
      backgroundColor: Colors.blue,
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
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    foregroundImage: NetworkImage(
                        'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
                  ),
                ),
                Text('Diana'),
                Text('Nyamai'),
              ],
            ),
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
                        style: setting.isChecked ? roundEdges : null,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.mail),
                        label: Text('Mail'),
                        style: setting.isChecked ? roundEdges : null,
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

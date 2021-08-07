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
    final avatar = const CircleAvatar(
      radius: 93,
      foregroundImage: NetworkImage(
          'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
    );
    final text = const Text(
      'Robyn \nFenty',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingsScreen.routeName),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Card(
        color: Colors.blue,
        child: Column(
          children: [
            Consumer<ProfileSettings>(
                builder: (ctx, setting, _) => setting.isTopBottom
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [avatar, text])
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textDirection: setting.isRight
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        children: [avatar, text])),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<ProfileSettings>(
                  builder: (ctx, setting, _) => ButtonBar(
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone),
                        label: const Text('Mobile'),
                        style: ElevatedButton.styleFrom(
                          shape: setting.isChecked ? StadiumBorder() : null,
                          primary: Colors.purple,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.mail),
                        label: const Text('Mail'),
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

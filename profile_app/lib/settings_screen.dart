import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile_settings.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';

  // ButtonStyle(
  //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  // );
  //ElevatedButton.styleFrom(shape: StadiumBorder())

  @override
  Widget build(BuildContext context) {
    final ButtonStyle toggleStyle = ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      primary: Colors.amber,
    );
    final profileData = Provider.of<ProfileSettings>(context, listen: false);
    final _isChecked = profileData.isChecked;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.black54,
            child: Consumer<ProfileSettings>(
              builder: (ctx, setting, _) => SwitchListTile(
                  title: Text(
                    'App Buttons Rounded',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: _isChecked,
                  onChanged: (_) => setting.toggleShape()),
            ),
          ),
          Card(
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Choose layout',
                    style: TextStyle(color: Colors.white),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Pic on left'),
                        style: _isChecked ? toggleStyle : null,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Pic on right'),
                        style: _isChecked ? toggleStyle : null,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Pic at top'),
                        style: _isChecked ? toggleStyle : null,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

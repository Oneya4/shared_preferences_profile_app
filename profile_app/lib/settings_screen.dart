import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile_settings.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isChecked = false;

  final ButtonStyle toggleStyle = ElevatedButton.styleFrom(
    shape: StadiumBorder(),
    primary: Colors.amber,
  );
  // ButtonStyle(
  //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  // );
  //ElevatedButton.styleFrom(shape: StadiumBorder())

  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<ProfileSettings>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.black54,
            child: SwitchListTile(
                title: Text(
                  'App Buttons Rounded',
                  style: TextStyle(color: Colors.white),
                ),
                value: _isChecked,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked = newValue;
                  });
                }),
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

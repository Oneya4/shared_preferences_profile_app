import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Card(
            child: SwitchListTile(
                title: Text('App Buttons Rounded'),
                value: _isChecked,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked = newValue;
                  });
                }),
          ),
          Card(
            child: Column(
              children: [
                Text('Choose layout'),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Pic on left'),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text('Pic on right')),
                    ElevatedButton(onPressed: () {}, child: Text('Pic at top')),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

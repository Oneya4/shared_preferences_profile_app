import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile_settings.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';

  @override
  Widget build(BuildContext context) {
    //Provider is invoked here to manage the state of the application
    Provider.of<ProfileSettings>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.black54,
            child: Consumer<ProfileSettings>(
              //Consumer() is set up here to listen to 0 1 changes to bool isChecked from the setting file
              builder: (ctx, setting, _) => SwitchListTile(
                title: Text(
                  'App Buttons Rounded',
                  style: TextStyle(color: Colors.white),
                ),
                value: setting.isChecked,
                onChanged: (_) {
                  setting.toggleSwitchTile();
                },
              ),
            ),
          ),
          Card(
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Choose layout',
                    style: TextStyle(color: Colors.white),
                  ),
                  Consumer<ProfileSettings>(
                    //A Consumer() is set up here so that we only rebuild this part of the tree
                    builder: (ctx, setting, _) => ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('Pic on left'),
                          onPressed: () {
                            setting.switchPosition('left');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: setting.isChecked ? StadiumBorder() : null,
                            primary: setting.isLeft ? Colors.amber : null,
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Pic on right'),
                          onPressed: () {
                            setting.switchPosition('right');
                          },
                          //Here we listen to changes in the profile settings file to know whether to toggle the style
                          style: ElevatedButton.styleFrom(
                            shape: setting.isChecked ? StadiumBorder() : null,
                            primary: setting.isRight ? Colors.amber : null,
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Pic at top'),
                          onPressed: () {
                            setting.switchPosition('topBottom');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: setting.isChecked ? StadiumBorder() : null,
                            primary: setting.isTopBottom ? Colors.amber : null,
                          ),
                        ),
                      ],
                    ),
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

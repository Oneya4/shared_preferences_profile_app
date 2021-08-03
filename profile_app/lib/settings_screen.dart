import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile_settings.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';

  @override
  Widget build(BuildContext context) {
    //Provider is invoked here to manage the state of the application
    Provider.of<ProfileSettings>(context, listen: false);

    final ButtonStyle roundEdges = ElevatedButton.styleFrom(
      shape: StadiumBorder(),
    );

    // Alternative way of initializing ButtonStyle
    // ButtonStyle(
    //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
    // );

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
                  setting.toggleState();
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
                          onPressed: () {},
                          child: const Text('Pic on left'),
                          style: setting.isChecked ? roundEdges : null,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Pic on right'),
                          //Here we listen to changes in the profile settings file to know whether to toggle the style
                          style: setting.isChecked ? roundEdges : null,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Pic at top'),
                          style: setting.isChecked ? roundEdges : null,
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

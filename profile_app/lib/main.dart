import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile_settings.dart';
import './profile_screen.dart';
import './settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProfileSettings(),
      child: MaterialApp(
        title: 'Profile App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Waiting(),
        routes: {
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}

class Waiting extends StatefulWidget {
  @override
  _WaitingState createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  bool voxt = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (c, s) => s.connectionState != ConnectionState.done
            ? SizedBox(
                child: Image(image: AssetImage('assets/images/download.jpg')),
                height: 150,
                width: 150,
              )
            : ProfileScreen());
  }
}

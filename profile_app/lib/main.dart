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
        debugShowCheckedModeBanner: false,
        title: 'Profile App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
            future: Future.delayed(Duration(seconds: 0)),
            builder: (ctx, s) => s.connectionState != ConnectionState.done
                ? Container(
                    color: Colors.white,
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/images/download.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : ProfileScreen()),
        routes: {
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}

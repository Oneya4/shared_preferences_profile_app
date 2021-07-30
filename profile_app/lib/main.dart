import 'package:flutter/material.dart';
import 'package:profile_app/settings_screen.dart';
// import 'package:provider/provider.dart';

// import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {SettingsScreen.routeName: (ctx) => SettingsScreen()},
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final profileData = Provider.of<Profile>(context, listen: false);
    return Scaffold(
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
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 80,
                foregroundImage:
                    AssetImage('assets/images/black-woman-fashion-photo.jpg'),
              ),
            ),
            Text('Diana'),
            Text('Nyamai'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:profile_app/settings_screen.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

// import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingsScreen>(
          create: (ctx) => SettingsScreen(),
        )
      ],
      child: MaterialApp(
        title: 'Profile App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        routes: {SettingsScreen.routeName: (ctx) => SettingsScreen()},
      ),
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    foregroundImage: NetworkImage(
                        'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
                  ),
                ),
              ],
            ),
            Text('Diana'),
            Text('Nyamai'),
          ],
        ),
      ),
    );
  }
}

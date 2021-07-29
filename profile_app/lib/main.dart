import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile.dart';

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
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<Profile>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Card(
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Image.asset(
                
              ),
            ),
            Text(profileData.firstName!),
            Text(profileData.secondName!),
          ],
        ),
      ),
    );
  }
}

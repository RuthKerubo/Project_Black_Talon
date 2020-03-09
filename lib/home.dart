import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

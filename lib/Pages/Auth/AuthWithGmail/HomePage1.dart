import 'package:flutter/material.dart';

import 'authService.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('You are logged in'),
      ElevatedButton(
          onPressed: () {
            AuthService().signOut();
          },
          child: Center(child: Text('LOG OUT')))
    ]));
  }
}

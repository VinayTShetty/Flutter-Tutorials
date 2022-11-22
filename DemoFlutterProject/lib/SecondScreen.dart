import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/FristScreen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('Click'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FristScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

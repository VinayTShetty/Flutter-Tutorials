import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Demo Project'),
            centerTitle: true,
          ),
          body: Center(
              child: Text('Hello Project')
          ),
        floatingActionButton: FloatingActionButton(
          child: Text('Press'),
          onPressed: () { 
            print('Fab Clicked');
          },
        ),
      )
  )
  );
}

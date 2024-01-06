import 'package:flutter/material.dart';

class ValueNotifierCounter extends StatelessWidget {
  ValueNotifierCounter({super.key});
  ValueNotifier<int> counterValNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    print("Entire Widget Build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifier'),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: counterValNotifier,
              builder: (context, value, child) {
                return Text(
                  'Counter Value :$value',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterValNotifier.value++;
          print(counterValNotifier.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

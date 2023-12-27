import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/Counter_Provider.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build Executed");
    final countprovider = Provider.of<CountProvider>(context,
        listen:
            false); // By Making it false , the entire widget build can be avoided.
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(child: Consumer<CountProvider>(
              builder: (context, value, child) {
                print("Text Widget Built");
                return Text(
                  value.count.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countprovider.setCounter();
          print("Increment Counter " + countprovider.count.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

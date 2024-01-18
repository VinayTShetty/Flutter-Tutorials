import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/color_bloc/color_bloc.dart';
import 'package:statemanagement/color_bloc/color_state.dart';
import 'package:statemanagement/counter_bloc/counter_bloc.dart';
import 'package:statemanagement/counter_bloc/counter_event.dart';
import 'package:statemanagement/counter_bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("Build Widget");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ColorBloc, ColorState>(buildWhen: (previous, current) {
            return true;
          }, builder: (context, state) {
            return Container(
              color: state.color,
              width: 200,
              height: 200,
            );
          }),
          BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) {
            return true;
          }, builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: TextStyle(fontSize: 20),
            );
          }),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                  context.read<ColorBloc>().add(CounterIncrementEvent());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                  context.read<ColorBloc>().add(CounterDecrementEvent());
                },
                child: const Icon(Icons.remove),
              )
            ],
          )
        ],
      ),
    );
  }
}

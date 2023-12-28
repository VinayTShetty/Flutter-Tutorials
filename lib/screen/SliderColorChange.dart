import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/Counter_Provider.dart';

import '../provider/ColorSlider_Provider.dart';

class ColorSlider extends StatefulWidget {
  const ColorSlider({super.key});

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  @override
  Widget build(BuildContext context) {
    print("Build Widget");
    return Scaffold(
      appBar: AppBar(
        title: Text('Mulitple Slider'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ColorProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setColorValue(val);
                });
          }),
          Consumer<ColorProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(value.value)),
                    child: Center(
                      child: Text('Blue'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(value.value)),
                    child: Center(
                      child: Text('Grey'),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

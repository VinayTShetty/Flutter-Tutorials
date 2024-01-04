import 'package:flutter/material.dart';
import 'package:statemanagement/provider/ColorSlider_Provider.dart';
import 'package:statemanagement/provider/Counter_Provider.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/Favorite_Provider.dart';
import 'package:statemanagement/screen/Counter.dart';
import 'package:statemanagement/screen/SliderColorChange.dart';

import 'screen/FavoriteScreen/FavoriteMain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteItemProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FavoritesScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/Favorite_Provider.dart';
import 'package:statemanagement/screen/FavoriteScreen/FavoriteItemSelected.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build Entire Widget");
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite'),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteItemSelected()));
                },
                child: Icon(Icons.favorite)),
            SizedBox(
              width: 20,
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Consumer<FavoriteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item ' + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  }),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              );
            }));
  }
}

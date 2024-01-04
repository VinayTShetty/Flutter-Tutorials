import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/Favorite_Provider.dart';

class FavoriteItemSelected extends StatefulWidget {
  const FavoriteItemSelected({super.key});

  @override
  State<FavoriteItemSelected> createState() => _FavoriteItemSelectedState();
}

class _FavoriteItemSelectedState extends State<FavoriteItemSelected> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
    print("Build Entire Widget ItemSelected Screen");
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Selected'),
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
            itemCount: favoriteProvider.selectedItem.length,
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

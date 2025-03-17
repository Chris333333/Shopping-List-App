import 'package:flutter/material.dart';
import 'package:shopping_list/models/products.dart';
import 'package:shopping_list/static/static_values.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Dodaj produkt',
              ),
              onSubmitted: (value) {
                StaticValues.staticShoppingList.add(Products(name: value, listTag: 1));
                setState(() {});
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: StaticValues.staticShoppingList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    title: Text(StaticValues.staticShoppingList[index].name),
                    style: ListTileStyle.list,
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        StaticValues.staticShoppingList.removeAt(index);
                        setState(() {});
                      },
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

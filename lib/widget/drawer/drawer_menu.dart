import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.checklist,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      'Shopping List',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("coś")
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '2025 Krystian Grzankowski',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
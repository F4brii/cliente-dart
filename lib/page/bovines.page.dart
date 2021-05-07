import 'package:flutter/material.dart';

import 'new-bovine-page.dart';

class BovinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Menu", home: BovinesWidget(), theme: ThemeData.dark());
  }
}

class BovinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganadero App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(""),
            ),
            ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text('Bovinos'),
            ),
            ListTile(
                leading: Icon(Icons.create),
                title: Text('Nuevo Bovino'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewBovinesScreen()),
                  );
                }),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}

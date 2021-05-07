import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Menu", home: MenuWidget(), theme: ThemeData.dark());
  }
}

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GanaderiaApp'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white30,
              ),
              child: Image(image: AssetImage('toro.png')),
            ),
            ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text('Bovinos'),
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text('Nuevo Bovino'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

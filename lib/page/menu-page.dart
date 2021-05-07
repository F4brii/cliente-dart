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
        title: const Text('Ganadero App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
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
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('toro.png'),
                        fit: BoxFit.contain,
                        height: 130.0,
                        width: 130.0,
                      ),
                      Text('Ganadero App',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

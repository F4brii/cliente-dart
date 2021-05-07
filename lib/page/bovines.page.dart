import 'dart:html';

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
  final _formKey = GlobalKey<FormState>();

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
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(15.0),
              child: Text(
                "Listado de bovinos",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                textScaleFactor: 0.6,
              ),
            ),
            Container(
              child: Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          child: Row(
                            children: [
                              Container(
                                  height: 90,
                                  width: 120,
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  )),
                              Container(
                                child: Text("aa"),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}

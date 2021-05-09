import 'dart:html';

import 'package:dart/models/bovine-model.dart';
import 'package:dart/services/bovine.services.dart';
import 'package:flutter/material.dart';

import 'new-bovine-page.dart';

class BovinesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BovinesWidget();
  }
}

class BovinesWidget extends State<BovinesScreen> {
  final BovineService _service = BovineService();
  Future<List<BovineModel>> Listado;

  @override
  void initState() {
    Listado = _service.GetListBovines();
    super.initState();
  }

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BovinesScreen()),
                );
              },
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
      backgroundColor: Colors.white.withOpacity(0.3),
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
              child: Container(
                child: Expanded(
                  child: Container(
                    child: Container(
                      child: FutureBuilder(
                          future: Listado,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              final datos = snapshot.data;
                              List<Container> list = [];
                              datos.forEach((element) {
                                list.add(Container(
                                  padding: new EdgeInsets.all(10.0),
                                  height: 240,
                                  child: Card(
                                    color: Color.fromRGBO(84, 197, 248, 1),
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Text(element.name),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              });

                              return ListView(
                                children: list,
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
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

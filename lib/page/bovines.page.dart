import 'dart:html';

import 'package:dart/models/bovine-model.dart';
import 'package:dart/services/bovine.services.dart';
import 'package:flutter/material.dart';

import 'detaeil.page.dart';
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
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  height: 220,
                                  child: Card(
                                    elevation: 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(5),
                                          child: Image(
                                            image: NetworkImage(element.image),
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child: Text(
                                                          "Datos del bovino"),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                  "Nombre: ${element.name}")
                                                            ],
                                                          ),
                                                          Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Text(
                                                                    "Peso: ${element.weight} Kg")
                                                              ])
                                                        ],
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              )),
                                              Expanded(child: Container())
                                            ],
                                          ),
                                        ))
                                      ],
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

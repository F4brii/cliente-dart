import 'package:dart/models/bovine-model.dart';
import 'package:dart/models/brand-model.dart';
import 'package:dart/services/brand.services.dart';
import 'package:flutter/material.dart';

import 'bovines.page.dart';
import 'new-bovine-page.dart';

class DetailPage extends StatefulWidget {
  final BovineModel bovine;

  DetailPage({@required this.bovine}) : super();
  @override
  State<StatefulWidget> createState() {
    return DetailScreen(bovine: bovine);
  }
}

class DetailScreen extends State<DetailPage> {
  final BovineModel bovine;
  final BrandService _service = new BrandService();
  Future<BrandModel> brand;

  DetailScreen({@required this.bovine});

  @override
  void initState() {
    brand = _service.GetBrand(bovine.brand);
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
                    MaterialPageRoute(builder: (context) => NewBovinesWidget()),
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
              alignment: Alignment.center,
              height: 100,
              child: Text(
                'Detalle del bovino # ${bovine.id}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
                textScaleFactor: 0.8,
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.black,
            )),
            Expanded(child: Container()),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

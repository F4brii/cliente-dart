import 'package:dart/models/brand-model.dart';
import 'package:dart/services/brand.services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'bovines.page.dart';

class NewBovinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Menu", home: NewBovinesWidget(), theme: ThemeData.dark());
  }
}

class NewBovinesWidget extends StatefulWidget {
  @override
  _NewBovinesWidgetState createState() => _NewBovinesWidgetState();
}

class _NewBovinesWidgetState extends State<NewBovinesWidget> {
  GlobalKey<FormState> llaveForm = new GlobalKey();

  TextEditingController nombreCtrl = new TextEditingController();

  TextEditingController pesoCtrl = new TextEditingController();

  TextEditingController marcaCtrl = new TextEditingController();

  final BrandService _service = BrandService();

  BrandModel brand;
  Future<List<BrandModel>> lista;

  @override
  void initState() {
    lista = _service.GetListBrand();
    super.initState();
  }

  _NewBovinesWidgetState() {}

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
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(60.0),
          child: new Form(
            key: llaveForm,
            child: formDesign(),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icono, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icono), title: item)),
    );
  }

  String genero = 'Macho';

  Widget formDesign() {
    return Column(
      children: <Widget>[
        Container(
          child: FutureBuilder(
            future: lista,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print("Trae datos");
                final datos = snapshot.data;
                List<BrandModel> a = [];
                datos.forEach((element) {
                  a.add(element);
                });

                if (brand == null) brand = a[0];

                return Container(
                    child: formItemsDesign(
                        null,
                        DropdownButton<BrandModel>(
                            isExpanded: true,
                            hint: Text("Select item"),
                            value: brand,
                            onChanged: (BrandModel Value) {
                              setState(() {
                                brand = Value;
                              });
                            },
                            items: a.map((BrandModel user) {
                              return DropdownMenuItem<BrandModel>(
                                value: user,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      user.brand,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            }).toList())));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        formItemsDesign(
            Icons.person,
            TextFormField(
              controller: nombreCtrl,
              decoration: new InputDecoration(
                labelText: 'Nombre bovino',
              ),
              validator: validarNombre,
            )),
        formItemsDesign(
            Icons.person,
            TextFormField(
              controller: marcaCtrl,
              decoration: new InputDecoration(
                labelText: 'Marca',
              ),
              validator: validarMarca,
            )),
        formItemsDesign(
            Icons.person,
            TextFormField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.left,
              controller: pesoCtrl,
              decoration: new InputDecoration(
                labelText: 'Peso Kg',
              ),
              validator: validarPeso,
            )),
        formItemsDesign(
            null,
            Column(children: <Widget>[
              Text(
                "Género",
                textAlign: TextAlign.left,
              ),
              RadioListTile<String>(
                title: const Text('Macho'),
                value: 'Macho',
                groupValue: genero,
                onChanged: (value) {
                  setState(() {
                    genero = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Hembra'),
                value: 'Hembra',
                groupValue: genero,
                onChanged: (value) {
                  setState(() {
                    genero = value;
                  });
                },
              )
            ])),
        GestureDetector(
            onTap: () {
              save();
            },
            child: Container(
              margin: new EdgeInsets.all(30.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Guardar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ))
      ],
    );
  }

  String validarNombre(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El campo nombre es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String validarMarca(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El campo marca es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "La marca debe de ser a-z y A-Z";
    }
    return null;
  }

  String validarPeso(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "El campo peso es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El peso debe ser numérico";
    } else if (int.parse(value) >= 2000 && int.parse(value) < 1) {
      return "El peso debe ser entre 1 y 2000 kg";
    }
    return null;
  }

  save() {
    if (llaveForm.currentState.validate()) {
      print("Nombre ${nombreCtrl.text}");
      print("Marca ${marcaCtrl.text}");
      print("Peso ${pesoCtrl.text}");
      llaveForm.currentState.reset();
    }
  }
}

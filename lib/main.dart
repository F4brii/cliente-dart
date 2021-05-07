import 'package:dart/page/login-page.dart';
import 'package:dart/services/bovine.services.dart';
import 'package:flutter/material.dart';

void main() {
  BovineService service = BovineService();
  service.GetListBovines().then((value) => print(value));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ganadero App",
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}

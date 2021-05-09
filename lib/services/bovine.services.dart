import 'dart:convert';

import 'package:dart/models/bovine-model.dart';
import 'package:http/http.dart' as http;

class BovineService {
  String dominio;
  String url;

  BovineService() {
    this.dominio = 'localhost:8000';
    this.url = '/bovines/';
  }

  Future<List<BovineModel>> GetListBovines() async {
    List<BovineModel> listado = [];
    final response = await http.get(Uri.http(this.dominio, this.url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      json.forEach((item) => {listado.add(BovineModel.fromJson(item))});
      return listado;
    } else {
      throw Exception('Failed to load Response');
    }
  }
}

import 'dart:convert';
import 'dart:io';

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

  Future<bool> PostBovine(String nombre, String peso, String Fecha, int marca,
      String imagen) async {
    final request =
        await http.MultipartRequest("POST", Uri.http(this.dominio, this.url));

    request.files.add(http.MultipartFile.fromString('image', imagen));

    request.fields['name'] = nombre;
    request.fields['weight'] = peso;
    request.fields['date_birth'] = Fecha;
    request.fields['brand'] = marca.toString();

    var res = await request.send();

    if (res.statusCode == 200)
      return true;
    else
      return false;
  }
}

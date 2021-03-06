import 'dart:convert';

import 'package:dart/models/brand-model.dart';
import 'package:http/http.dart' as http;

class BrandService {
  String dominio;
  String url;

  BrandService() {
    this.dominio = 'localhost:8000';
    this.url = '/brands';
  }

  Future<BrandModel> GetBrand(int id) async {
    final response = await http.get(Uri.http(this.dominio, this.url + '/$id'));
    if (response.statusCode == 200) {
      return BrandModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Response');
    }
  }

  Future<List<BrandModel>> GetListBrand() async {
    List<BrandModel> listado = [];
    final response = await http.get(Uri.http(this.dominio, this.url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      json.forEach((item) => {listado.add(BrandModel.fromJson(item))});
      return listado;
    } else {
      throw Exception('Failed to load Response');
    }
  }
}

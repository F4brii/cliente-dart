import 'package:http/http.dart' as http;

class BrandService {
  String dominio;
  String url;

  BrandService() {
    this.dominio = 'localhost:8000';
    this.url = '/brands';
  }

  Future<String> GetListBrands() async =>
      (await http.get(Uri.http(this.dominio, this.url))).body;
}

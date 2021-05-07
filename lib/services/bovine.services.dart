import 'package:http/http.dart' as http;

class BovineService {
  String dominio;
  String url;

  BovineService() {
    this.dominio = 'localhost:8000';
    this.url = '/bovines/';
  }

  Future<String> GetListBovines() async =>
      (await http.get(Uri.http(this.dominio, this.url, {'page': '1'}))).body;
}

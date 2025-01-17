import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  String url;
  Network(this.url);

  Future getData() async {
    print("Start waiting");
    http.Response response = await http.get(url);
    print("End waiting");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

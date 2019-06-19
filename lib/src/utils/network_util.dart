import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkUtil {
  Future<dynamic> getData(String url) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);
  Future getData() async {
    http.Response response = await http.get(url);
    // 'https://api.openweathermap.org/data/2.5/weather?lat=28.895515&lon=76.606613&appid=$apiKey');
    // 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
    // print(response.body);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}

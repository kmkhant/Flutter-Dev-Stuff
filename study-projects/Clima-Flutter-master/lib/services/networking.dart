import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  final url;

  Future getData() async {
    http.Response response = await http.get(
      url,
      headers: {
        'x-rapidapi-host': "community-open-weather-map.p.rapidapi.com",
        'x-rapidapi-key': "1423bee535msh000fa2cafbf9ceep15f9b8jsnedfcb8a3efa0"
      },
    );
    if (response.statusCode == 200) {
      // print(response.body);
      String data = response.body;
      String jsonData = data.substring(5, data.length - 1);

      return jsonDecode(jsonData);
    }
  }
}

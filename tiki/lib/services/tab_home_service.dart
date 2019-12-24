import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tiki/models/home_product.dart';

class TabHomeService {
  Future<HomeProduct> fetchHomeProductData() async {
    String url = "https://trungnguyen.izysync.com/rest/V1/mobileapi/stores/home";
    String urlFake =
        "https://raw.githubusercontent.com/duytungshrek/JSON/master/response.json";
    final response = await http.get(urlFake);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // If the call to the server was successful, parse the JSON.
      return HomeProduct.fromJson(data);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

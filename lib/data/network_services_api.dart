import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkServicesApi {
  static Future<Map<String, dynamic>> getApi(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}

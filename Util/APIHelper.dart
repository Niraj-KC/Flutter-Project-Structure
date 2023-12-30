import 'dart:convert';
import 'package:http/http.dart' as http;

class APIHelper{
  // ignore: constant_identifier_names
  static const String BASE_URI = "http://";

  static Future post(
      String uri,
      dynamic body,
      {
        Map<String, String>header = const <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        String errorMsg = "Failed",
      }
      )
  async {
    final res = await http.post(
      Uri.parse(BASE_URI+uri),
      headers: header,
      body: body,
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception(errorMsg);
    }

  }


}

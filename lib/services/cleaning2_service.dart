import 'package:http/http.dart' as http;
import 'dart:convert';

class Cleaning2 {
  getInformation(String url) async {
    Map<String, dynamic> data = {};

    try {
      await http.get(Uri.parse(url)).then((response) {
        data = jsonDecode(response.body);
      });
    } catch (e) {
      return e;
    }
    return data;
  }

  cleanJson(raw) {
    //raw es el map a limpiar
    List invalidValues = ['-', 'N/A', ''];
    if (raw is Map) {
      raw.removeWhere((key, value) => invalidValues.contains(value));
      for (var key in raw.keys) {
        raw[key] = cleanJson(raw[key]);
      }
    } else if (raw is List) {
      raw.removeWhere((value) => invalidValues.contains(value));
      for (var i = 0; i < raw.length; i++) {}
    }
    return raw;
  }
}

void main() async {
  var map = await Cleaning2().getInformation(
      'https://coderbyte.com/api/challenges/json/json-cleaning');
  print(map);

  var clean = Cleaning2().cleanJson(map);
  print(clean);
}

import 'dart:convert';
import 'package:http/http.dart' as http;
//import '../model/cleaning_model.dart';

class CleaningService {
  getCleaning() async {
    const url = 'https://coderbyte.com/api/challenges/json/json-cleaning';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final respuesta = json.decode(response.body);

    if (response.statusCode == 200) {
      return respuesta;
    } else {
      throw Exception('Failed to load post');
    }
  }

  removeVal(respuesta) {
    //List invalidValues = ['-', 'N/A', ''];
    Map<String, dynamic> newMap = {};
    respuesta.forEach((key, value) {
      if (value is Map) {
        newMap[key] = removeVal(value);
      } else if (value is List) {
        value.removeWhere((e) => e == '-');
        newMap[key] = value;
      } else if (value != '-' && value != '' && value != 'N/A') {
        newMap[key] = value;
      }
    });
    return newMap;
  }
}

void main() async {
  var map = await CleaningService().getCleaning();
  //print(map);

  var clean = CleaningService().removeVal(map);
  //print(clean);
}

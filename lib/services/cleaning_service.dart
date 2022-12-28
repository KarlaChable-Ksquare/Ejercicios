// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cleaning_model.dart';

class CleaningService {
  Future<Cleaning> getCleaning() async {
    const url = 'https://coderbyte.com/api/challenges/json/json-cleaning';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);

    Map<dynamic, dynamic> respuesta = json.decode(response.body);
    //print(respuesta);

    Map<dynamic, dynamic> removeVal(Map<dynamic, dynamic> respuesta) {
      Map<dynamic, dynamic> newMap = {};
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

    print(removeVal(respuesta));

    if (response.statusCode == 200) {
      return Cleaning.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}

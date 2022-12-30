import 'dart:convert';

import '../model/distance_model.dart';
import 'package:http/http.dart' as http;

class DistanceService {
  Future<List<DistanceModel>> getAll() async {
    const url = 'https://restcountries.com/v2/all?fields=name,capital,latlng';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final countries = json.map((e) {
        return DistanceModel.fromJson(e);
      }).toList();
      //print(countries);
      return countries;
    }
    return [];
  }
}

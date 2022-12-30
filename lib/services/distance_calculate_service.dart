import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Countries {
  getCountries() async {
    const url = 'https://restcountries.com/v2/all?fields=name,capital,latlng';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      // final mexToJap = json
      //     .where((e) => e['name'] == 'Mexico' || e['name'] == 'Japan')
      //     .toList();
      // print(mexToJap);

      return json;
    }
    return [];
  }

  getDistance(double lat1, double lng1, double lat2, double lng2) {
    /*
    Radio Ecuatorial 6,378.1 km
    Radio Polar 6,356.8 km
    Radio Medio 6,371.0 km
    */
    var ecuatorialR = 6378.1;
    var difLat = lat1 - lat2;
    var difLng = lng1 - lng2;
    var pie = pi / 180;

    var radianLat = difLat * (pie);
    var radianLng = difLng * (pie);

    var constA = pow(sin(radianLat / 2), 2) +
        (cos(lat1 * pie) * cos(lat2 * pie) * pow(sin(radianLng / 2), 2));
    var constC = 2 * atan2(sqrt(constA), sqrt((1 - constA)));
    var constD = ecuatorialR * constC;
    return constD;
  }
}

void main() async {
  var map = await Countries().getCountries();
  print(map[144]);
  print(map[Random().nextInt(215)]);

  var mexLat = map[144]['latlng'][0];
  var mexLng = map[144]['latlng'][1];

  var greeLat = map[88]['latlng'][0];
  var greeLng = map[88]['latlng'][1];

  var distance = Countries().getDistance(mexLat, mexLng, greeLat, greeLng);
  print(distance);
}

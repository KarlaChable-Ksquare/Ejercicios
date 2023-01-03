import 'dart:convert';

import 'package:http/http.dart' as http;

class UsersClean {
  getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    // final uri = Uri.parse(url);
    // final response = await http.get(uri);
    // final respuesta = json.decode(response.body);

    // if (response.statusCode == 200) {
    //   return respuesta;
    // } else {
    //   throw Exception('Failed to load post');
    // }

    List respuesta = [];
    try {
      await http.get(Uri.parse(url)).then((response) {
        respuesta = jsonDecode(response.body);
      });
    } catch (e) {
      return e;
    }
    return respuesta;
  }

  removeGlenna(respuesta) {
    for (var user in respuesta) {
      user.removeWhere((key, value) => value == 'Glenna Reichert');
      //print(respuesta);
    }
    return respuesta;
  }

  sortList(respuesta) {
    respuesta
        .sort((a, b) => a['name'].toString().compareTo(b['name'].toString()));
    return respuesta;
  }

  removeGeo(respuesta) {
    for (var user in respuesta) {
      //print(user['address']);
      user['address'].remove('geo');
      //print(user['address']);
      //return respuesta;
    }
    return respuesta;
  }
}

void main() async {
  var lista = await UsersClean().getUsers();
  print(lista);
  //print(lista[8]);

  var clean = UsersClean().removeGlenna(lista);
  //print(clean); //se elimino el id:9.

  var orden = UsersClean().sortList(lista);
  //print(orden);

  var noGeo = UsersClean().removeGeo(lista);
  //print(noGeo);
}

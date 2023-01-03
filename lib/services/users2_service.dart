import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersApi {
  Future<List> getUsers() async {
    List users = [];

    var requestURL = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(requestURL);
    users = jsonDecode(response.body);

    //print(users.toString());
    return users;
  }

  Future users() async {
    List users = await getUsers();
    //print(users);
    for (var user in users) {
      user['address'].remove('geo');
    }
    //print(users);
    return users;
  }
}

void main() async {
  var usuarios = UsersApi().getUsers();
  //print(usuarios.toString());

  var userNoGeo = await UsersApi().users();
  print(userNoGeo.toString());
}

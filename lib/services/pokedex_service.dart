import 'dart:convert';
import 'package:http/http.dart' as http;

class PokedexService {
  fetchPokemon() async {
    const url =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    final uri = Uri.parse(url);

    Map<String, dynamic> pokemones = {};
    try {
      /*
      final response = await http.get(uri);
      var pokemones = jsonDecode(response.body);*/

      await http.get(uri).then((response) {
        pokemones = jsonDecode(response.body);
        //print(response.statusCode);
        //print(response.body);
        List<dynamic> pokedex = pokemones["pokemon"];
        var pokemon1 = pokedex[150]['img'];
        print(pokemon1);
      });
    } catch (e) {
      print(e);
    }
    return pokemones;
  }
}

void main() async {
  var pokemones = await PokedexService().fetchPokemon();
  //print(pokemones);
  //print(pokemones[Random().nextInt(100)]);
}

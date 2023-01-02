import 'package:flutter/material.dart';

import '../services/pokedex_service.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  Color _typeColor(String type) {
    switch (type) {
      case 'Bug':
        return Color(0xFF92bd2d);

      case 'Dark':
        return Color(0xFF595761);

      case 'Dragon':
        return Color(0xFF0c6ac8);

      case 'Electric':
        return Color(0xFFf2d94e);

      case 'Fairy':
        return Color(0xFFef90e6);

      case 'Fighing':
        return Color(0xFFd3425f);

      case 'Fire':
        return Color(0xFFfba64c);

      case 'Fly':
        return Color(0xFFa1bbec);

      case 'Ghost':
        return Color(0xFF5f6dbc);

      case 'Grass':
        return Color(0xFF60bd58);

      case 'Ground':
        return Color(0xFFda7c4d);

      case 'Ice':
        return Color(0xFF76d1c1);

      case 'Normal':
        return Color(0xFFa0a29f);

      case 'Poison':
        return Color(0xFFb763cf);

      case 'Psychic':
        return Color(0xFFfa8582);

      case 'Rock':
        return Color(0xFFc9bc8a);

      case 'Steel':
        return Color(0xFF5795a3);

      case 'Water':
        return Color(0xFF539ddf);

      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.shade700,
      ),
      body: Column(children: [
        FutureBuilder(
            future: PokedexService().fetchPokemon(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> pokemones = snapshot.data!;
                List<dynamic> pokedex = pokemones["pokemon"];
                //var pokemon1 = pokedex[150]['img'];
                return Expanded(
                    child: ListView.builder(
                  itemCount: pokedex.length,
                  itemBuilder: (BuildContext context, int index) {
                    final pokemon = pokedex[index];
                    final type = pokemon['type'][0].toString();
                    return GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, '/pokedexEach',
                            arguments: {
                              'num': pokemon['num'].toString(),
                              'name': pokemon['name'],
                              'img': pokemon['img'],
                              'type': pokemon['type'],
                              'weaknesses': pokemon['weaknesses'],
                              'next_evolution': pokemon['next_evolution'],
                            });
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          trailing: Text(type),
                          leading: CircleAvatar(
                            backgroundColor: _typeColor(type),
                            child: const Icon(
                              Icons.catching_pokemon,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(pokemon['name'].toString()),
                          subtitle: Text(pokemon['num'].toString()),
                        ),
                      ),
                    );
                  },
                ));
              }
              if (snapshot.hasError) {
                return const Text('Error, no data');
              }
              return const Center(
                  heightFactor: 20,
                  widthFactor: 20,
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ));
            }),
      ]),
    );
  }
}

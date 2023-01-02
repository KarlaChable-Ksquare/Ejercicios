import 'package:flutter/material.dart';

class PokedexEach extends StatelessWidget {
  dynamic data;
  PokedexEach({super.key, required this.data});

  String _types(String type1, String type2) {
    if (type1.isNotEmpty) {
      return 'Types: $type1';
    }
    if (type2.isNotEmpty) {
      return 'Type: $type2';
    } else {
      return 'nada';
    }
  }

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
        title: const Text('Pokemon Details'),
        backgroundColor: Colors.redAccent.shade400,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.catching_pokemon_sharp),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        color: _typeColor(data['type'][0].toString()),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: Image.network(
                    data['img'],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  data['name'].toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(data['num'].toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 8.0,
                ),
                Text('Types: ' + data['type'].toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 8.0,
                ),
                Text('Weaknesses: ' + data['weaknesses'].toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500)),
              ],
            )),
      ),
    );
    ;
  }
}

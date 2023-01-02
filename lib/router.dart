import 'package:flutter/material.dart';
import 'package:mazetv/custom/movie._titles_each.dart';
import 'package:mazetv/screens/movie_list.dart';

import 'custom/pokedex_each.dart';
import 'screens/cleaning_list.dart';
import 'screens/distance_calculate.dart';
import 'screens/distance_list.dart';
import 'screens/movie_titles.dart';
import 'screens/pokedex.dart';

class RouterGenerator {
  var routerGenerate = ((settings) {
    var routerName = settings.name;
    var args = settings.arguments;

    switch (routerName) {
      case '/cleaning':
        return MaterialPageRoute(
            builder: (context) => SafeArea(child: CleaningList()));

      case '/calculate':
        return MaterialPageRoute(
            builder: (context) => const SafeArea(child: DistanceCalculate()));

      case '/countries':
        return MaterialPageRoute(
            builder: (context) => const SafeArea(child: DistanceList()));

      case '/movies':
        return MaterialPageRoute(
            builder: (context) => const SafeArea(child: MovieList()));

      case '/moviesTitles':
        return MaterialPageRoute(
            builder: (context) => const SafeArea(child: MovieTitles()));

      case '/movieEach':
        return MaterialPageRoute(
            builder: (context) => SafeArea(child: MovieEach(data: args)));

      case '/pokedex':
        return MaterialPageRoute(
            builder: (context) => const SafeArea(child: Pokedex()));

      case '/pokedexEach':
        return MaterialPageRoute(
            builder: (context) => SafeArea(child: PokedexEach(data: args)));
    }
  });
}

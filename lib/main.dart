import 'package:flutter/material.dart';
import 'package:mazetv/screens/distance_list.dart';
import 'package:mazetv/screens/pokedex.dart';
import 'package:provider/provider.dart';

import 'provider/distance_provider.dart';
import 'provider/movie_provider.dart';
import 'router.dart';
import 'screens/cleaning_list.dart';
import 'screens/distance_calculate.dart';
import 'screens/movie_list.dart';
import 'screens/movie_titles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(), // <== checar siempre
        )
      ],
      child: MaterialApp(
        title: 'Ejercicios',
        theme: ThemeData(
            //primarySwatch: Colors.pink,
            ),
        onGenerateRoute: RouterGenerator().routerGenerate, // <== checar siempre
        initialRoute: '/',
        home: const Pokedex(),
      ),
    );
  }
}

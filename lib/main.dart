import 'package:flutter/material.dart';
import 'package:mazetv/screens/distance_list.dart';
import 'package:provider/provider.dart';

import 'provider/distance_provider.dart';
import 'provider/movie_provider.dart';
import 'screens/cleaning_list.dart';
import 'screens/movie_list.dart';

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
          create: (context) => DistanceProvider(), // <== checar siempre
        )
      ],
      child: MaterialApp(
        title: 'Ejercicios',
        theme: ThemeData(
            //primarySwatch: Colors.pink,
            ),
        home: CleaningList(), // <== checar siempre
      ),
    );
  }
}

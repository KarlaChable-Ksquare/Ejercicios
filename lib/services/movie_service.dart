import 'dart:convert';

import 'package:mazetv/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<MovieModel>> getMovies() async {
    const url = 'http://api.tvmaze.com/shows';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final movies = json.map((e) {
        return MovieModel.fromJson(e);
      }).toList();
      return movies;
    }
    return [];
  }
}

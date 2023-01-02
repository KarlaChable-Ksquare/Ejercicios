import 'dart:convert';
import '../model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieTitlesService {
  Future<List<MovieModel>> fetchMovies() async {
    const url = 'http://api.tvmaze.com/shows';
    final uri = Uri.parse(url);
    List<MovieModel> movies = [];

    try {
      final response = await http.get(uri);
      var json = jsonDecode(response.body) as List;
      movies = json.map((e) {
        return MovieModel.fromJson(e);
      }).toList();
      return movies;
    } catch (e) {
      print(e);
    }
    return [];
  }
}

// void main() async {
//   var movies = await MovieTitles().fetchMovies();
//   print(movies[1].toString());
//   //print(movies[Random().nextInt(100)]);
// }

import 'package:flutter/material.dart';
import 'package:mazetv/services/movie_service.dart';
import '../model/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  final _service = MovieService();
  bool isLoading = false;
  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  Future<void> getAllMovies() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getMovies();

    _movies = response;
    isLoading = false;
    notifyListeners();
  }
}

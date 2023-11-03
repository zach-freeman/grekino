import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';

class GreatMovieProvider extends ChangeNotifier {
  GreatMovieDatabase? _greatMovieDatabase;

  GreatMovieProvider() {
    getMovieListFuture();
  }

  void initGreatMovieDatabase(GreatMovieDatabase greatMovieDatabase) {
    _greatMovieDatabase = greatMovieDatabase;
  }

  List<GreatMovies> _greatMovieListFuture = [];
  List<GreatMovies> get greatMovieListFuture => _greatMovieListFuture;
  String _error = '';
  String get error => _error;

  void getMovieListFuture() {
    _greatMovieDatabase?.moviesForVolume(1).then((value) {
      _greatMovieListFuture = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }
}

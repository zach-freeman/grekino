import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/repositories/great_movies_repository.dart';
import 'package:flutter_great_movies/repositories/i_great_movies_repository.dart';
import 'package:flutter_great_movies/repositories/i_tmdb_repository.dart';
import 'package:flutter_great_movies/repositories/tmdb_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;
void setupLocator() {
  locator.registerSingleton<IGreatMoviesRepository>(
      GreatMoviesRepository(GreatMovieDatabase()));
  locator.registerSingleton<ITmdbRepository>(TmdbRepository());
}

import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/repositories/great_movies_repository.dart';
import 'package:grekino/repositories/i_great_movies_repository.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';
import 'package:grekino/repositories/tmdb_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;
void setupLocator() {
  locator.registerSingleton<IGreatMoviesRepository>(
      GreatMoviesRepository(GreatMovieDatabase()));
  locator.registerSingleton<ITmdbRepository>(TmdbRepository());
}

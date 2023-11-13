import 'package:flutter_great_movies/repositories/i_tmdb_repository.dart';
import 'package:flutter_great_movies/repositories/tmdb_repository.dart';
import 'package:get_it/get_it.dart';
final locator = GetIt.I;
void setupLocator() {
  locator.registerSingleton<ITmdbRepository>(TmdbRepository());
}
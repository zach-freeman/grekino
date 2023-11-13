import 'dart:ffi';

import 'package:flutter_great_movies/models/tmdb_configuration_model.dart';

abstract class ITmdbRepository {
  Future<String> getImageUrlPrefix();
}

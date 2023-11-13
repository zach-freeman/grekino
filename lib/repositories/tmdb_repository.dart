import 'dart:ffi';

import 'package:flutter_great_movies/models/tmdb_configuration_model.dart';
import 'package:flutter_great_movies/repositories/i_tmdb_repository.dart';
import 'package:flutter_great_movies/services/api_service.dart';

class TmdbRepository extends ITmdbRepository {
  String? baseImageUrl;
  String? fileSize;
  @override
  Future<String> getImageUrlPrefix() async {
    if (baseImageUrl == null && fileSize == null) {
      TmdbConfiguration configuration =
          (await ApiService().getTmdbConfiguration())!;
      baseImageUrl = configuration.images.secureBaseUrl;
      fileSize = configuration.images.posterSizes.first;
    }
    return "$baseImageUrl$fileSize";
  }
}

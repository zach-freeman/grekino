import 'dart:developer';

import 'package:grekino/api_keys.dart';
import 'package:grekino/models/tmdb_configuration_model.dart';
import 'package:grekino/models/tmdb_results_model.dart';
import 'package:http/http.dart' as http;
import 'package:grekino/constants.dart';

class ApiService {
  Future<TmdbResults?> getTmdbMovieResults(String imdbId) async {
    try {
      var url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.findEndpoint}/tt$imdbId?external_source=imdb_id&api_key=$tmdbApiKey");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        TmdbResults model = tmdbResultsFromJson(response.body);
        return model;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<TmdbConfiguration?> getTmdbConfiguration() async {
    try {
      var url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.configurationEndpoint}?api_key=$tmdbApiKey");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        TmdbConfiguration model = tmdbConfigurationFromJson(response.body);
        return model;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

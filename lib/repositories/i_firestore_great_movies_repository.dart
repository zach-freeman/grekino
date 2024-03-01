import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grekino/models/great_movie_model.dart';

import '../models/firestore_great_movie_model.dart';

abstract class IFirestoreGreatMoviesRepository {
  Stream<QuerySnapshot> getStream();
  Stream<QuerySnapshot> getStreamForVolume(int volume);
  Stream<List<GreatMovieModel>> getMoviesForVolume(int volume);
  Future<GreatMovieModel?> getMovieForId(String id);
  Future<GreatMovieModel?> getMovieForImdbId(String imdbId);
  Future<void> addGreatMovie(GreatMovieModel greatMovie);
  Future<void> updateGreatMovie(GreatMovieModel greatMovie);
}
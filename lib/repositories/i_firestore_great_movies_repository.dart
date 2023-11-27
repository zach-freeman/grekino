import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firestore_great_movie_model.dart';

abstract class IFirestoreGreatMoviesRepository {
  Stream<QuerySnapshot> getStream();
  Stream<QuerySnapshot> getStreamForVolume(int volume);
  Future<FirestoreGreatMovie?> getMovieForId(String id);
  Future<void> addGreatMovie(FirestoreGreatMovie firestoreGreatMovie);
  Future<void> updateGreatMovie(FirestoreGreatMovie firestoreGreatMovie);
}
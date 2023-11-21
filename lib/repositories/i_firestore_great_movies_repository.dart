import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firestore_great_movie_model.dart';

abstract class IFirestoreGreatMoviesRepository {
  Stream<QuerySnapshot> getStream();
  Future<DocumentReference> addGreatMovie(FirestoreGreatMovie firestoreGreatMovie);
  void updateGreatMovie(FirestoreGreatMovie firestoreGreatMovie);
}
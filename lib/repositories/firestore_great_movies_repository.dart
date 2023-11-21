

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grekino/models/firestore_great_movie_model.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';

class FireStoreGreatMovieRepository extends IFirestoreGreatMoviesRepository {
  final CollectionReference collection =
  FirebaseFirestore.instance.collection('great_movies');

  @override
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  @override
  Future<DocumentReference<Object?>> addGreatMovie(FirestoreGreatMovie firestoreGreatMovie) {
    return collection.add(firestoreGreatMovie);
  }

  @override
  void updateGreatMovie(FirestoreGreatMovie firestoreGreatMovie) async {
    await collection.doc(firestoreGreatMovie.id).update(firestoreGreatMovie.toJson());
  }
  
}


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
  Stream<QuerySnapshot> getStreamForVolume(int volume) {
    return collection.where('Volume', isEqualTo: volume).orderBy('Name').snapshots();
  }

  @override
  Future<FirestoreGreatMovie?> getMovieForId(String id) async {
    var document = await collection.doc(id).get();
    if (document.exists) {
      return FirestoreGreatMovie.fromSnapshot(document);
    }
    return null;
  }

  @override
  Future<void> addGreatMovie(FirestoreGreatMovie firestoreGreatMovie) {
    return collection.doc(firestoreGreatMovie.id).set(firestoreGreatMovie.toJson());
  }

  @override
  void updateGreatMovie(FirestoreGreatMovie firestoreGreatMovie) async {
    await collection.doc(firestoreGreatMovie.id).update(firestoreGreatMovie.toJson());
  }

}
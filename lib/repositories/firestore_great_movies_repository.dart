import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';
import 'package:grekino/utils/great_movie_model_utils.dart';

class FireStoreGreatMovieRepository extends IFirestoreGreatMoviesRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('great_movies');

  @override
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  @override
  Stream<QuerySnapshot> getStreamForVolume(int volume) {
    return collection
        .where('Volume', isEqualTo: volume)
        .orderBy('Name')
        .snapshots();
  }

  @override
  Stream<List<GreatMovieModel>> getMoviesForVolume(int volume) {
    var snapshots = collection
        .where('Volume', isEqualTo: volume)
        .orderBy('Name')
        .snapshots();
    return snapshots.map((query) => query.docs
        .map((snapshot) {
      try {
        return GreatMovieModel.fromJson(snapshot.data());
      } catch (e) {
        return GreatMovieModel();
      }
    }).toList());
  }

  @override
  Future<GreatMovieModel?> getMovieForId(String id) async {
    var document = await collection.doc(id).get();
    if (document.exists) {
      return GreatMovieModelUtils.fromSnapshot(document);
    }
    return null;
  }

  @override
  Future<GreatMovieModel?> getMovieForImdbId(String imdbId) async {
    var document = await collection.where('ImdbId', isEqualTo: imdbId).get();
    return GreatMovieModelUtils.fromSnapshot(document.docs.first);
  }

  @override
  Future<void> addGreatMovie(GreatMovieModel greatMovie) {
    return collection.doc(greatMovie.id).set(greatMovie.toJson());
  }

  @override
  Future<void> updateGreatMovie(GreatMovieModel greatMovie) async {
    await collection.doc(greatMovie.id).update(greatMovie.toJson());
  }
}

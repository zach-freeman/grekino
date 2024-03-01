
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grekino/models/great_movie_model.dart';

class GreatMovieModelUtils {
  GreatMovieModelUtils._();

  static GreatMovieModel fromSnapshot(DocumentSnapshot snapshot) {
    final newGreatMovie = GreatMovieModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newGreatMovie.firestoreId = snapshot.reference.id;
    return newGreatMovie;
  }
}
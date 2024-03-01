
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grekino/models/great_movie_model.dart';

class GreatMovieModelUtils {
  GreatMovieModelUtils._();

  static GreatMovieModel fromSnapshot(DocumentSnapshot snapshot) {
    final newGreatMovie = GreatMovieModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newGreatMovie.id = snapshot.reference.id;
    return newGreatMovie;
  }

  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
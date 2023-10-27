import 'package:flutter/foundation.dart' show immutable;

@immutable
class GreateMovieModel {
  final String id;
  final String name;
  final String director;
  final int year;
  final int volume;
  final bool isCriterion;
  final bool isWatched;
  final String watchedDate;
  final String userStarRating;
  final String userNotes;

  const GreateMovieModel({
    required this.id,
    required this.name,
    required this.director,
    required this.year,
    required this.volume,
     required this.isCriterion,
    required this.isWatched,
    required this.watchedDate,
    required this.userStarRating,
    required this. userNotes
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "director": director,
      "year": year,
      "volume": volume,
      "isCriterion": isCriterion,
      "isWatched": isWatched,
      "watchedDate": watchedDate,
      "userStarRating": userStarRating,
      "userNotes": userNotes
    };
  }
}

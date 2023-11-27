

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreGreatMovie {
  String id;
  String name;
  String director;
  int volume;
  int year;
  List<String> genres;
  String description;
  String imdbId;
  String posterImageUrl;
  bool isCriterion;
  bool isWatched;
  String dateWatched;
  double userStarRating;
  String userReview;

  FirestoreGreatMovie({
    required this.id,
    required this.name,
    required this.director,
    required this.volume,
    required this.year,
    required this.genres,
    required this.description,
    required this.imdbId,
    required this.posterImageUrl,
    required this.isCriterion,
    required this.isWatched,
    required this.dateWatched,
    required this.userStarRating,
    required this.userReview,
  });

  factory FirestoreGreatMovie.fromSnapshot(DocumentSnapshot snapshot) {
    final newFirestoreGreatMovie = FirestoreGreatMovie.fromJson(snapshot.data() as Map<String, dynamic>);
    newFirestoreGreatMovie.id = snapshot.reference.id;
    return newFirestoreGreatMovie;
  }

  factory FirestoreGreatMovie.fromJson(Map<String, dynamic> json) => FirestoreGreatMovie(
    id: json["Id"],
    name: json["Name"],
    director: json["Director"],
    volume: json["Volume"],
    year: json["Year"],
    genres: List<String>.from(json["Genres"].map((x) => x)),
    description: json["Description"],
    imdbId: json["ImdbId"],
    posterImageUrl: json["PosterImageUrl"],
    isCriterion: json["IsCriterion"],
    isWatched: json["IsWatched"],
    dateWatched: json["DateWatched"],
    userStarRating: json["UserStarRating"],
    userReview: json["UserReview"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Director": director,
    "Volume": volume,
    "Year": year,
    "Genres": List<dynamic>.from(genres.map((x) => x)),
    "Description": description,
    "ImdbId": imdbId,
    "PosterImageUrl": posterImageUrl,
    "IsCriterion": isCriterion,
    "IsWatched": isWatched,
    "DateWatched": dateWatched,
    "UserStarRating": userStarRating,
    "UserReview": userReview,
  };
}

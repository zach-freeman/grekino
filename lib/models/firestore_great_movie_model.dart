

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreGreatMovie {
  String? id;
  String? name;
  String? director;
  int? volume;
  int? year;
  List<String>? genres;
  String? imdbId;
  String? posterImageUrl;
  bool? isCriterion;
  bool? isWatched;
  String? dateWatched;
  int? userStarRating;
  String? userReview;

  FirestoreGreatMovie(
      {this.id,
        this.name,
        this.director,
        this.volume,
        this.year,
        this.genres,
        this.imdbId,
        this.posterImageUrl,
        this.isCriterion,
        this.isWatched,
        this.dateWatched,
        this.userStarRating,
        this.userReview});

  factory FirestoreGreatMovie.fromSnapshot(DocumentSnapshot snapshot) {
    final newFirestoreGreatMovie = FirestoreGreatMovie.fromJson(snapshot.data() as Map<String, dynamic>);
    newFirestoreGreatMovie.id = snapshot.reference.id;
    return newFirestoreGreatMovie;
  }

  FirestoreGreatMovie.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    director = json['Director'];
    volume = json['Volume'];
    year = json['Year'];
    genres = json['Genres'].cast<String>();
    imdbId = json['ImdbId'];
    posterImageUrl = json['PosterImageUrl'];
    isCriterion = json['IsCriterion'];
    isWatched = json['IsWatched'];
    dateWatched = json['DateWatched'];
    userStarRating = json['UserStarRating'];
    userReview = json['UserReview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Director'] = director;
    data['Volume'] = volume;
    data['Year'] = year;
    data['Genres'] = genres;
    data['ImdbId'] = imdbId;
    data['PosterImageUrl'] = posterImageUrl;
    data['IsCriterion'] = isCriterion;
    data['IsWatched'] = isWatched;
    data['DateWatched'] = dateWatched;
    data['UserStarRating'] = userStarRating;
    data['UserReview'] = userReview;
    return data;
  }
}

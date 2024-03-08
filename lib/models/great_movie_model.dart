
import 'package:isar/isar.dart';

import '../utils/great_movie_model_utils.dart';
part 'great_movie_model.g.dart';

@collection
class GreatMovieModel {
  String? id;
  Id get isarId => GreatMovieModelUtils.fastHash(id!);
  String? name;
  String? director;
  int? volume;
  int? year;
  List<String>? genres;
  String? description;
  String? imdbId;
  String? posterImageUrl;
  bool? isCriterion;
  bool? isWatched;
  String? dateWatched;
  double? userStarRating;
  String? userReview;
  bool isSynced;

  GreatMovieModel({
    this.id,
    this.name,
    this.director,
    this.volume,
    this.year,
    this.genres,
    this.description,
    this.imdbId,
    this.posterImageUrl,
    this.isCriterion,
    this.isWatched,
    this.dateWatched,
    this.userStarRating,
    this.userReview,
    this.isSynced = true,
  });

  factory GreatMovieModel.fromJson(json) => GreatMovieModel(
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
    "Genres": List<dynamic>.from(genres!.map((x) => x)),
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
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TmdbResults tmdbResultsFromJson(String str) =>
    TmdbResults.fromJson(json.decode(str));

String tmdbResultsToJson(TmdbResults data) => json.encode(data.toJson());

class TmdbResults {
  List<MovieResult> movieResults;
  List<dynamic> personResults;
  List<dynamic> tvResults;
  List<dynamic> tvEpisodeResults;
  List<dynamic> tvSeasonResults;

  TmdbResults({
    required this.movieResults,
    required this.personResults,
    required this.tvResults,
    required this.tvEpisodeResults,
    required this.tvSeasonResults,
  });

  factory TmdbResults.fromJson(Map<String, dynamic> json) => TmdbResults(
        movieResults: List<MovieResult>.from(
            json["movie_results"].map((x) => MovieResult.fromJson(x))),
        personResults: List<dynamic>.from(json["person_results"].map((x) => x)),
        tvResults: List<dynamic>.from(json["tv_results"].map((x) => x)),
        tvEpisodeResults:
            List<dynamic>.from(json["tv_episode_results"].map((x) => x)),
        tvSeasonResults:
            List<dynamic>.from(json["tv_season_results"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "movie_results":
            List<dynamic>.from(movieResults.map((x) => x.toJson())),
        "person_results": List<dynamic>.from(personResults.map((x) => x)),
        "tv_results": List<dynamic>.from(tvResults.map((x) => x)),
        "tv_episode_results":
            List<dynamic>.from(tvEpisodeResults.map((x) => x)),
        "tv_season_results": List<dynamic>.from(tvSeasonResults.map((x) => x)),
      };
}

class MovieResult {
  bool adult;
  String backdropPath;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  List<int> genreIds;
  double popularity;
  DateTime releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  MovieResult({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/models/tmdb_results_model.dart';
import 'package:flutter_great_movies/services/api_service.dart';
import 'package:flutter_great_movies/views/movie_add_view.dart';

class MovieListItem extends StatefulWidget {
  final String pageTitle;
  final GreatMovies greatMovie;

  const MovieListItem(
      {super.key, required this.pageTitle, required this.greatMovie});

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  late TmdbResults? _tmdbResults;

  @override
  void initState() {
    super.initState();
    _getImageUrl();
  }

  void _getImageUrl() async {
    _tmdbResults =
        (await ApiService().getTmdbMovieResults(widget.greatMovie.imdbId))!;
    if (_tmdbResults != null) {
      var movieResult = _tmdbResults?.movieResults[0];
      if (movieResult != null) {
        var test = movieResult.id;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(
          child: Column(children: [
        Text(widget.greatMovie.name),
        Text(widget.greatMovie.director),
        Text(widget.greatMovie.year.toString()),
        const Spacer(),
      ])),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) =>
                  MovieAddView(greatMovie: widget.greatMovie)));
        },
      ),
    );
  }
}

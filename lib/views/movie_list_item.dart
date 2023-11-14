import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_great_movies/locator.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/models/tmdb_results_model.dart';
import 'package:flutter_great_movies/repositories/i_tmdb_repository.dart';
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
  String? _posterImageUrl;

  @override
  void initState() {
    super.initState();
    _getImageUrl();
  }

  void _getImageUrl() async {
    TmdbResults tmdbResults =
        (await ApiService().getTmdbMovieResults(widget.greatMovie.imdbId))!;
    var movieResult = tmdbResults.movieResults[0];
    ITmdbRepository tmdbRepository = locator<ITmdbRepository>();
    String imageUrlPrefix = await tmdbRepository.getImageUrlPrefix();
    setState(() {
      _posterImageUrl = imageUrlPrefix + movieResult.posterPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: _getBody(context),
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

  Widget _getBody(BuildContext context) {
    final posterImageUrl = _posterImageUrl;
    if (posterImageUrl != null) {
      return Center(
          child: Column(children: [
        CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: posterImageUrl),
        Text(widget.greatMovie.name),
        Text(widget.greatMovie.director),
        Text(widget.greatMovie.year.toString()),
        const Spacer(),
      ]));
    }
    return const CircularProgressIndicator();
  }
}

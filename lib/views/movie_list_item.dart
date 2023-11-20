import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/view_models/movie_list_item_view_model.dart';
import 'package:grekino/views/movie_add_view.dart';
import 'package:provider/provider.dart';

class MovieListItem extends StatefulWidget {
  final String pageTitle;
  final GreatMovies greatMovie;

  const MovieListItem(
      {super.key, required this.pageTitle, required this.greatMovie});

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  void initState() {
    super.initState();
    context
        .read<MovieListItemViewModel>()
        .getMovieInfo(widget.greatMovie.id, widget.greatMovie.imdbId);
  }

  @override
  Widget build(BuildContext context) {
    final movieListItemViewModel = context.watch<MovieListItemViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            // do your navigate here
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: _getBody(context, movieListItemViewModel),
      floatingActionButton: _getWatchFab(movieListItemViewModel),
    );
  }

  Widget _getBody(
      BuildContext context, MovieListItemViewModel movieListItemViewModel) {
    if (movieListItemViewModel.loading) {
      return const CircularProgressIndicator();
    }
    return Column(children: [
      Container(
          padding: const EdgeInsets.all(25),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.greatMovie.name,
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Text("${widget.greatMovie.year} | DIRECTED BY",
                    style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                Text(widget.greatMovie.director,
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
            Column(
              children: [
                CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl: movieListItemViewModel.posterImageUrl),
              ],
            )
          ])),
      Row(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(movieListItemViewModel.description)))
        ],
      ),
      _watchInfo(),
    ]);
  }

  Widget _watchInfo() {
    if (widget.greatMovie.isWatched) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ColoredBox(
            color: Colors.grey.shade100,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text("You watched this film"),
                    const SizedBox(width: 5),
                    Icon(Icons.star,
                        color: widget.greatMovie.userStarRating > 0.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                    Icon(Icons.star,
                        color: widget.greatMovie.userStarRating > 1.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                    Icon(Icons.star,
                        color: widget.greatMovie.userStarRating > 2.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                    Icon(Icons.star,
                        color: widget.greatMovie.userStarRating > 3.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                  ],
                ))),
      );
    }
    return Container();
  }

  Widget _getWatchFab(MovieListItemViewModel movieListItemViewModel) {
    if (!widget.greatMovie.isWatched) {
      return FloatingActionButton(
        elevation: 10.0,
        child: const Icon(Icons.remove_red_eye),
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => MovieAddView(
                  greatMovie: widget.greatMovie,
                  posterImageUrl: movieListItemViewModel.posterImageUrl)));
        },
      );
    }
    return Container();
  }
}

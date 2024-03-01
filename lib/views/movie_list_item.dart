import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grekino/view_models/movie_list_item_view_model.dart';
import 'package:grekino/views/movie_add_view.dart';
import 'package:grekino/views/movie_diary_entry_view.dart';
import 'package:provider/provider.dart';

import '../models/great_movie_model.dart';

class MovieListItem extends StatefulWidget {
  final String pageTitle;
  final GreatMovieModel greatMovie;

  const MovieListItem(
      {super.key, required this.pageTitle, required this.greatMovie});

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context
            .read<MovieListItemViewModel>()
            .getMovieInfo(widget.greatMovie.firestoreId, widget.greatMovie.imdbId);
      }
    });
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
      floatingActionButton: _getWatchFab(movieListItemViewModel, widget.greatMovie.isWatched),
    );
  }

  Widget _getBody(
      BuildContext context, MovieListItemViewModel movieListItemViewModel) {
    if (movieListItemViewModel.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(children: [
      Container(
          padding: const EdgeInsets.all(25),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.greatMovie.name!,
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Text("${widget.greatMovie.year} | DIRECTED BY",
                    style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                Text(widget.greatMovie.director!,
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
      _watchInfo(widget.greatMovie.isWatched, widget.greatMovie.userStarRating)
    ]);
  }

  Widget _watchInfo(bool? isWatched, double? userStarRating) {
    if (isWatched! && userStarRating != null) {
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
                        color: userStarRating > 0.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                    Icon(Icons.star,
                        color: userStarRating > 1.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                    Icon(Icons.star,
                        color: userStarRating > 2.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                    Icon(Icons.star,
                        color: userStarRating > 3.0
                            ? Colors.green.shade400
                            : Colors.grey.shade100),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.black54),
                      style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      highlightColor: Colors.green,
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return _getBottomSheet(widget.greatMovie.name, widget.greatMovie.userStarRating);
                          },
                        );
                      },
                    )
                  ],
                ))),
      );
    }
    return Container();
  }

  Widget _getBottomSheet(String? movieName, double? userStarRating) {
    if (movieName != null && userStarRating != null) {
      return Container(
        height: 450,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(movieName,
                  style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text(widget.greatMovie.year.toString(),
                  textAlign: TextAlign.center),
              const Divider(),
              Icon(
                Icons.remove_red_eye,
                color: Colors.green.shade400,
                size: 55,
              ),
              const Text('Watched',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center),
              const Divider(),
              const Text('Rated',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star,
                      color: userStarRating > 0.0
                          ? Colors.green.shade400
                          : Colors.grey),
                  Icon(Icons.star,
                      color: userStarRating > 1.0
                          ? Colors.green.shade400
                          : Colors.grey),
                  Icon(Icons.star,
                      color: userStarRating > 2.0
                          ? Colors.green.shade400
                          : Colors.grey),
                  Icon(Icons.star,
                      color: userStarRating > 3.0
                          ? Colors.green.shade400
                          : Colors.grey),
                ],
              ),
              const Divider(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieDiaryEntryView(
                                    greatMovie: widget.greatMovie)));
                  },
                  child: const Text('Show your activity',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal))),
              const Divider(),
              ElevatedButton(
                child: const Text('Done',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }

  Widget _getWatchFab(MovieListItemViewModel movieListItemViewModel, bool? isWatched) {
    if (!isWatched!) {
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

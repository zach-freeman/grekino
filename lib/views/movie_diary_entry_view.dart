import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grekino/models/firestore_great_movie_model.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/view_models/movie_diary_entry_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'movie_add_view.dart';

class MovieDiaryEntryView extends StatefulWidget {
  final GreatMovieModel greatMovie;

  const MovieDiaryEntryView({super.key, required this.greatMovie});

  @override
  State<MovieDiaryEntryView> createState() => _MovieDiaryEntryViewState();
}

class _MovieDiaryEntryViewState extends State<MovieDiaryEntryView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context
            .read<MovieDiaryEntryViewModel>()
            .getMovieInfo(widget.greatMovie.firestoreId, widget.greatMovie.imdbId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieDiaryEntryViewModel = context.watch<MovieDiaryEntryViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch Entry'),
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            // do your navigate here
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25),
              child: IconButton(
                icon: const Icon(Icons.more_horiz_outlined),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return _getMoreBottomSheet(movieDiaryEntryViewModel);
                      });
                },
              ))
        ],
      ),
      body: _getBody(context, movieDiaryEntryViewModel),
    );
  }

  Widget _getBody(
      BuildContext context, MovieDiaryEntryViewModel movieDiaryEntryViewModel) {
    if (movieDiaryEntryViewModel.loading) {
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 7),
                Text("${widget.greatMovie.year}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 7),
                _ratingStars(widget.greatMovie.userStarRating),
                const SizedBox(height: 7),
                Text(
                    'Watched ${DateFormat('MMM d, yyyy').format(parseDate(widget.greatMovie.dateWatched!))}',
                    style:
                        const TextStyle(fontSize: 15, color: Colors.black54)),
              ],
            ),
            Column(
              children: [
                CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl: movieDiaryEntryViewModel.posterImageUrl),
              ],
            )
          ])),
    ]);
  }

  DateTime parseDate(String dateWatched) {
    return DateFormat("yyyy-MM-dd").parse(widget.greatMovie.dateWatched!);
  }

  Widget _ratingStars(double? userStarRating) {
    if (userStarRating != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
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
        ],
      );
    }
    return const SizedBox();
  }

  Widget _getMoreBottomSheet(
      MovieDiaryEntryViewModel viewModel
  ) {
    return Container(
      height: 250,
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
            Text(widget.greatMovie.name ?? 'Unknown',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(
                'Watched ${DateFormat('MMM d, yyyy').format(parseDate(widget.greatMovie.dateWatched ?? ''))}',
                textAlign: TextAlign.center),
            const Divider(),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return _confirmDeleteBottomSheet(viewModel);
                      });
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: const Text('Delete',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center)),
            const Divider(),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => MovieAddView(
                          greatMovie: widget.greatMovie,
                          posterImageUrl: widget.greatMovie.posterImageUrl ?? '')));
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: const Text('Edit',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center)),
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

  Widget _confirmDeleteBottomSheet(MovieDiaryEntryViewModel viewModel) {
    return Wrap(
      children: <Widget>[
        ListTile(
          title: const Text('Delete Watch Entry', textAlign: TextAlign.center,),
          textColor: Colors.red,
          onTap: () {
            viewModel.deleteMovieWatchEntry(widget.greatMovie.firestoreId);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        ListTile(
          title: const Text('Cancel', textAlign: TextAlign.center,),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

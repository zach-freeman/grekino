import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grekino/models/firestore_great_movie_model.dart';
import 'package:grekino/view_models/movie_diary_entry_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MovieDiaryEntryView extends StatefulWidget {
  final FirestoreGreatMovie greatMovie;

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
            .getMovieInfo(widget.greatMovie.id, widget.greatMovie.imdbId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieDiaryEntryViewModel = context.watch<MovieDiaryEntryViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Entry'),
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            // do your navigate here
            Navigator.of(context).pop();
          },
        ),
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
                Text(widget.greatMovie.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 7),
                Text("${widget.greatMovie.year}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 7),
                _ratingStars(),
                const SizedBox(height: 7),
                Text(
                    'Watched ${DateFormat('MMM d, yyyy').format(parseDate(widget.greatMovie.dateWatched))}',
                    style: const TextStyle(fontSize: 15, color: Colors.black54)),
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
    return DateFormat("yyyy-MM-dd").parse(widget.greatMovie.dateWatched);
  }

  Widget _ratingStars() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
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
    );
  }

  Widget _getBottomSheet() {
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
            Text(widget.greatMovie.name,
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
                    color: widget.greatMovie.userStarRating > 0.0
                        ? Colors.green.shade400
                        : Colors.grey),
                Icon(Icons.star,
                    color: widget.greatMovie.userStarRating > 1.0
                        ? Colors.green.shade400
                        : Colors.grey),
                Icon(Icons.star,
                    color: widget.greatMovie.userStarRating > 2.0
                        ? Colors.green.shade400
                        : Colors.grey),
                Icon(Icons.star,
                    color: widget.greatMovie.userStarRating > 3.0
                        ? Colors.green.shade400
                        : Colors.grey),
              ],
            ),
            const Divider(),
            TextButton(
                onPressed: () {},
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
}

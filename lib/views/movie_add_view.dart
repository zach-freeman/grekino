import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/view_models/movie_add_view_model.dart';
import 'package:flutter_great_movies/views/movie_add_review_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

typedef StringCallback = void Function(String review);

class MovieAddView extends StatefulWidget {
  final GreatMovies greatMovie;
  final String posterImageUrl;

  const MovieAddView({super.key, required this.greatMovie, required this.posterImageUrl});

  @override
  State<MovieAddView> createState() => _MovieAddViewState();
}

class _MovieAddViewState extends State<MovieAddView> {
  DateTime selectedDate = DateTime.now();
  double selectedRating = 0.0;
  String userReview = "Add review...";
  static const double outerHorizontalPadding = 0.0;
  static const double innerHorizontalPadding = 25.0;

  // #docregion styles
  final cancelTextStyle = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    fontSize: 14,
  );

  final nameTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 16,
    height: 2,
  );

  final yearTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w200,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 12,
    height: 2,
  );

  final entryTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2,
  );

  final valueTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w200,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 16,
    height: 2,
  );
  // #enddocregion styles

  @override
  void initState() {
    super.initState();
    if (!widget.greatMovie.dateWatched.contains('1990-07-07')) {
      DateTime dateWatched =
          DateFormat("yyyy-MM-dd").parse(widget.greatMovie.dateWatched);
      selectedDate = dateWatched;
    }
    selectedRating = widget.greatMovie.userStarRating;
    userReview = widget.greatMovie.userReview.isNotEmpty
        ? widget.greatMovie.userReview
        : "Add Review...";
  }

  @override
  Widget build(BuildContext context) {
    final movieAddViewModel = context.watch<MovieAddViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: cancelTextStyle),
          ),
        ),
        leadingWidth: 100,
        title: const Text("I Watched..."),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: TextButton(
                onPressed: () {
                  movieAddViewModel.updateMovie(widget.greatMovie.id, selectedDate, selectedRating, userReview);
                  Navigator.pop(context);
                },
                child: const Text("Save")),
          )
        ],
      ),
      body: Center(
          child: Column(children: [
        movieInfo(widget.greatMovie, widget.posterImageUrl),
        dateWatched(context),
        const Divider(),
        rated(),
        const Divider(),
        addReview(),
      ])),
    );
  }

  Widget movieInfo(GreatMovies greatMovie, String posterImageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: outerHorizontalPadding),
      child: ColoredBox(
          color: Colors.grey.shade100,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: innerHorizontalPadding, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  CachedNetworkImage(imageUrl: posterImageUrl, width: 35, height: 35),
                  const SizedBox(width: 5),
                  Text(greatMovie.name, style: nameTextStyle),
                  const SizedBox(width: 5),
                  Text(greatMovie.year.toString())
                ],
              ))),
    );
  }

  Widget dateWatched(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: outerHorizontalPadding),
      child: ColoredBox(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: innerHorizontalPadding, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date", style: entryTypeTextStyle),
                  datePicker(context)
                ],
              ))),
    );
  }

  Widget datePicker(BuildContext context) {
    return TextButton(
        child: Text(DateFormat('EEEE, MMMM d, yyyy').format(selectedDate),
            style: valueTextStyle),
        onPressed: () => _selectDate(context));
  }

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
        return buildCupertinoDatePicker(context);
    }
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  buildCupertinoDatePicker(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  // #docregion ratings, stars
  Widget stars() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              _setRating(1.0);
            },
            icon: Icon(Icons.star,
                color:
                    selectedRating > 0.0 ? Colors.green[500] : Colors.black)),
        IconButton(
            onPressed: () {
              _setRating(2.0);
            },
            icon: Icon(Icons.star,
                color:
                    selectedRating > 1.0 ? Colors.green[500] : Colors.black)),
        IconButton(
            onPressed: () {
              _setRating(3.0);
            },
            icon: Icon(Icons.star,
                color:
                    selectedRating > 2.0 ? Colors.green[500] : Colors.black)),
        IconButton(
            onPressed: () {
              _setRating(4.0);
            },
            icon: Icon(Icons.star,
                color:
                    selectedRating > 3.0 ? Colors.green[500] : Colors.black)),
      ],
    );
  }

  _setRating(double rating) {
    setState(() {
      selectedRating = rating;
    });
  }

  // #enddocregion stars
  Widget rated() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: outerHorizontalPadding),
      child: ColoredBox(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: innerHorizontalPadding, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rated", style: entryTypeTextStyle),
                      stars()
                    ],
                  )
                ],
              ))),
    );
  }

  Widget addReview() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: outerHorizontalPadding),
        child: ColoredBox(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: innerHorizontalPadding, vertical: 10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => MovieAddReviewView(
                                          onDoneTapped: (String review) {
                                        _setReview(review);
                                      })));
                            },
                            child: Text(userReview,
                                textAlign: TextAlign.left,
                                style: entryTypeTextStyle)),
                      ],
                    ),
                  ],
                ))));
  }

  _setReview(String review) {
    setState(() {
      userReview = review;
    });
  }
}

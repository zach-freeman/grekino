import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MovieAddView extends StatefulWidget {
  final GreatMovies greatMovie;

  const MovieAddView({super.key, required this.greatMovie});

  @override
  State<MovieAddView> createState() => _MovieAddViewState();
}

class _MovieAddViewState extends State<MovieAddView> {
  DateTime selectedDate = DateTime.now();

  // #docregion styles
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
  Future updateMovie(BuildContext context, String id) async {
    var database = Provider.of<GreatMovieDatabase>(context, listen: false);
    return await database.updateMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        leadingWidth: 80,
        title: const Text("I Watched..."),
        centerTitle: true,
        actions: [TextButton(onPressed: () {}, child: const Text("Save"))],
      ),
      body: Center(
          child: Column(children: [
        movieInfo(widget.greatMovie),
        dateWatched(context),
        const Divider(),
        rated(),
        const Divider(),
        addReview(),
      ])),
    );
  }

  Widget movieInfo(GreatMovies greatMovie) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: ColoredBox(
          color: Colors.grey.shade100,
          child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Text(greatMovie.name, style: nameTextStyle),
                  const SizedBox(width: 10),
                  Text(greatMovie.year.toString())
                ],
              ))),
    );
  }

  Widget dateWatched(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: ColoredBox(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
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
        child: Text(DateFormat('EEEE, MMMM d, yyyy').format(selectedDate), style: valueTextStyle),
        onPressed: () => _selectDate(context));
  }

  _selectDate(BuildContext context) async {
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

  // #docregion ratings, stars
  final stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      const Icon(Icons.star, color: Colors.black),
      const Icon(Icons.star, color: Colors.black),
    ],
  );

  // #enddocregion stars
  Widget rated() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: ColoredBox(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Rated", style: entryTypeTextStyle), stars],
                  )
                ],
              ))),
    );
  }

  Widget addReview() {
    return const Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: ColoredBox(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(hintText: 'Add Review...'),
                    ),
                  ],
                ))));
  }
}

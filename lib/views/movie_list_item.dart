import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/views/movie_add_view.dart';

class MovieListItem extends StatelessWidget {
  final String pageTitle;
  final GreatMovies greatMovie;

  const MovieListItem(
      {super.key, required this.pageTitle, required this.greatMovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Center(
          child: Column(children: [
        Text(greatMovie.name),
        Text(greatMovie.director),
        Text(greatMovie.year.toString()),
        const Spacer(),
      ])),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => MovieAddView(greatMovie: greatMovie)));
        },
      ),
    );
  }
}

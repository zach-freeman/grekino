import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:provider/provider.dart';

Future updateMovie(String id) async {
  final database = GreatMovieDatabase();
  return await database.updateMovie(id);
}

class MovieListItem extends StatelessWidget {
  final String pageTitle;
  final GreatMovies greatMovie;

  const MovieListItem(
      {super.key, required this.pageTitle, required this.greatMovie});

  Future updateMovie(BuildContext context, String id) async {
    var database = Provider.of<GreatMovieDatabase>(context, listen: false);
    return await database.updateMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Column(
        children: [
          Text(greatMovie.name),
          Text(greatMovie.director),
          Text(greatMovie.year.toString()),
          const Spacer(),
          Center(
            child: OutlinedButton(
              onPressed: () {
                updateMovie(context, greatMovie.id);
              },
              child: const Text('I have watched this movie!'),
            ),
          ),
        ],
      ),
    );
  }
}

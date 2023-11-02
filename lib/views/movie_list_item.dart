import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';

Future updateMovie(String id) async {
  final database = GreatMovieDatabase();
  return await database.updateMovie(id);
}

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
      body: Column(
        children: [
          Text(greatMovie.name),
          Text(greatMovie.director),
          Text(greatMovie.year.toString()),
          const Spacer(),
          Center(
            child: OutlinedButton(
              onPressed: () {
                updateMovie(greatMovie.id);
              },
              child: const Text('I have watched this movie!'),
            ),
          ),
        ],
      ),
    );
  }
}

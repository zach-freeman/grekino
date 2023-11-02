import 'package:flutter/material.dart';
import 'package:flutter_great_movies/views/movie_list_item.dart';
import '../models/great_movie_model.dart';

Future<List<GreatMovies>> fetchMovies(int volumeNumber) async {
  final database = GreatMovieDatabase();
  return await database.moviesForVolume(volumeNumber);
}

class VolumeMovieList extends StatelessWidget {
  final int volume;
  const VolumeMovieList({super.key, required this.volume});
  @override
  Widget build(BuildContext context) {
    var title = 'Volume $volume';
    return FutureBuilder(
      future: fetchMovies(volume),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox(
            width: 40.0,
            height: 40.0,
            child: CircularProgressIndicator(),
          ));
        }

        if (snapshot.hasData) {
          return MaterialApp(
            title: title,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
            ),
            home: Scaffold(
              appBar: AppBar(title: Text(title)),
              body: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final greatMovie = snapshot.data[index];
                    return ListTile(
                      title: Text(greatMovie.name),
                      trailing: const Icon(Icons.visibility),
                      iconColor: greatMovie.isWatched ? Colors.blue : Colors.grey,
                      subtitle: Text(greatMovie.director),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieListItem(
                                    pageTitle: title, greatMovie: greatMovie)));
                      },
                    );
                  }),
            ),
          );
        }

        return Container();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_great_movies/views/movie_list_item.dart';
import '../models/great_movie_model.dart';

Future<List<GreatMovies>> fetchMovies(int volumeNumber) async {
  final database = GreatMovieDatabase();
  return await database.moviesForVolume(volumeNumber);
}

class VolumeMovieList extends StatefulWidget {
  final int volume;
  const VolumeMovieList({super.key, required this.volume});

  @override
  State<VolumeMovieList> createState() => _VolumeMovieListState();
}

class _VolumeMovieListState extends State<VolumeMovieList> {
  List<GreatMovies> greatMovies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    fetchMovies(widget.volume).then((result) {
      setState(() {
        isLoading = false;
        greatMovies = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = 'Volume ${widget.volume}';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: isLoading
          ? const Center(
              child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: CircularProgressIndicator(),
            ))
          : Scaffold(
              appBar: AppBar(title: Text(title)),
              body: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: greatMovies.length,
                  itemBuilder: (context, index) {
                    final greatMovie = greatMovies[index];
                    return ListTile(
                      title: Text(greatMovie.name),
                      trailing: const Icon(Icons.visibility),
                      iconColor:
                          greatMovie.isWatched ? Colors.blue : Colors.grey,
                      subtitle: Text(greatMovie.director),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieListItem(
                                    pageTitle: title,
                                    greatMovie: greatMovie))).then((value) => {
                              fetchMovies(widget.volume).then((result) {
                                setState(() {
                                  isLoading = false;
                                  greatMovies = result;
                                });
                              })
                            });
                      },
                    );
                  }),
            ),
    );
  }
}

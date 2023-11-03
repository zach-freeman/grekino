import 'package:flutter/material.dart';
import 'package:flutter_great_movies/views/movie_list_item.dart';
import 'package:provider/provider.dart';
import '../models/great_movie_model.dart';

class VolumeMovieList extends StatefulWidget {
  final int volume;
  const VolumeMovieList({super.key, required this.volume});

  @override
  State<VolumeMovieList> createState() => _VolumeMovieListState();
}

class _VolumeMovieListState extends State<VolumeMovieList> {
  late GreatMovieDatabase greatMovieDatabase;

  @override
  Widget build(BuildContext context) {
    greatMovieDatabase = Provider.of<GreatMovieDatabase>(context);
    var title = 'Volume ${widget.volume}';
    return FutureBuilder(
      future: fetchMovies(widget.volume),
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
                  itemCount: snapshot.data.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    final greatMovie = snapshot.data[index];
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
                                });
                              })
                            });
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

  Future<List<GreatMovies>> fetchMovies(int volumeNumber) async {
    return await greatMovieDatabase.moviesForVolume(volumeNumber);
  }
}

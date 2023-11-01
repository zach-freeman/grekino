import 'package:flutter/material.dart';
import '../models/great_movie_model.dart';

Future<List<GreatMovies>> fetchMovies() async {
  final database = GreatMovieDatabase();
  return await database.moviesForVolume(2);
}

class VolumeTwoList extends StatelessWidget {
  const VolumeTwoList({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Volume Two';
    return FutureBuilder(
      future: fetchMovies(),
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
              appBar: AppBar(title: const Text(title)),
              body: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final greatMovie = snapshot.data[index];
                    return ListTile(
                      title: Text(greatMovie.name),
                      subtitle: Text(greatMovie.director),
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

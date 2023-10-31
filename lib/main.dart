import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = GreatMovieDatabase();
  List<GreatMovies> allItems = await database.moviesForVolume(1);
  runApp(MyApp(greatMovies: allItems));
}

class MyApp extends StatelessWidget {
  final List<GreatMovies> greatMovies;
  const MyApp({super.key, required this.greatMovies});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'Great Movies';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ListView.builder(
            itemCount: greatMovies.length,
            itemBuilder: (context, index) {
              final greatMovie = greatMovies[index];
              return ListTile(
                title: Text(greatMovie.name),
                subtitle: Text(greatMovie.director),
              );
            }),
      ),
    );
  }
}

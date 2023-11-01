import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/views/volume_movie_list.dart';
import 'package:flutter_great_movies/views/volume_one_list.dart';
import 'package:flutter_great_movies/views/volume_two_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = GreatMovieDatabase();
  List<GreatMovies> allItems = await database.moviesForVolume(1);
  runApp(GreatMovieApp(greatMovies: allItems));
}

class GreatMovieApp extends StatelessWidget {
  final List<GreatMovies> greatMovies;
  const GreatMovieApp({super.key, required this.greatMovies});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.filter_1)),
                Tab(icon: Icon(Icons.filter_2)),
                Tab(icon: Icon(Icons.filter_3)),
              ],
            ),
            title: const Text('Great Movies'),
          ),
          body: const TabBarView(
            children: [
              VolumeMovieList(volume: 1),
              VolumeMovieList(volume: 2),
              VolumeMovieList(volume: 3),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/views/volume_movie_list.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Provider<GreatMovieDatabase>(
    create: (context) => GreatMovieDatabase(),
    child: const GreatMovieApp(),
    dispose: (context, db) => db.close(),
  ));
}

class GreatMovieApp extends StatelessWidget {
  const GreatMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.filter_1)),
                Tab(icon: Icon(Icons.filter_2)),
                Tab(icon: Icon(Icons.filter_3)),
                Tab(icon: Icon(Icons.filter_4)),
              ],
            ),
            title: const Text('Great Movies'),
          ),
          body: const TabBarView(
            children: [
              VolumeMovieList(volume: 1),
              VolumeMovieList(volume: 2),
              VolumeMovieList(volume: 3),
              VolumeMovieList(volume: 4)
            ],
          ),
        ),
      ),
    );
  }
}

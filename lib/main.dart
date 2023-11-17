import 'package:flutter/material.dart';
import 'package:flutter_great_movies/locator.dart';
import 'package:flutter_great_movies/view_models/movie_add_view_model.dart';
import 'package:flutter_great_movies/view_models/volume_movie_list_view_model.dart';
import 'package:flutter_great_movies/view_models/movie_list_item_view_model.dart';
import 'package:flutter_great_movies/views/volume_movie_list.dart';
import 'package:provider/provider.dart';

import 'delegates/movie_search_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => VolumeMovieListViewModel()),
      ChangeNotifierProvider(create: (_) => MovieListItemViewModel()),
      ChangeNotifierProvider(create: (_) => MovieAddViewModel()),
    ],
    child: const MaterialApp(home: GreatMovieApp()),
  ));
}

class GreatMovieApp extends StatelessWidget {
  const GreatMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: IconButton(
                    onPressed: () {
                      // method to show the search bar
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: MovieSearchDelegate());
                    },
                    icon: const Icon(Icons.search),
                  ))
            ],
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
      );;
  }
}

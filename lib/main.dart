import 'package:flutter/material.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';
import 'package:grekino/view_models/movie_add_view_model.dart';
import 'package:grekino/view_models/movie_diary_entry_view_model.dart';
import 'package:grekino/view_models/volume_movie_list_view_model.dart';
import 'package:grekino/view_models/movie_list_item_view_model.dart';
import 'package:grekino/views/auth_gate_view.dart';
import 'package:grekino/views/splash_view.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'init.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Future initFuture = Init.initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => VolumeMovieListViewModel(
              greatMoviesProvider: locator<IGreatMoviesProvider>())),
      ChangeNotifierProvider(
          create: (_) => MovieListItemViewModel(
              greatMoviesProvider: locator<IGreatMoviesProvider>())),
      ChangeNotifierProvider(
          create: (_) => MovieAddViewModel(
              greatMoviesProvider: locator<IGreatMoviesProvider>())),
      ChangeNotifierProvider(
          create: (_) => MovieDiaryEntryViewModel(
              greatMoviesProvider: locator<IGreatMoviesProvider>(),
              tmdbRepository: locator<ITmdbRepository>()))
    ],
    child: MaterialApp(
        home: FutureBuilder(
            future: initFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const AuthGateView();
              } else {
                return const SplashView();
              }
            }),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        )),
  ));
}

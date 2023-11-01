import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/great_movie_model.dart';

Future<List<GreatMovies>> fetchMovies() async {
  final database = GreatMovieDatabase();
  return await database.moviesForVolume(1);
}

class VolumeOneList extends StatefulWidget {
  const VolumeOneList({super.key});

  @override
  State<VolumeOneList> createState() => _VolumeOneListState();
}

class _VolumeOneListState extends State<VolumeOneList> {
  List<GreatMovies> greatMovies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies().then((result) {
      setState(() {
        greatMovies = result;
      });
    });
  }

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

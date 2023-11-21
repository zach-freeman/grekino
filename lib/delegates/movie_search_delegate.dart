import 'dart:async';

import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:grekino/repositories/i_great_movies_repository.dart';

import '../locator.dart';
import '../models/great_movie_model.dart';
import '../views/movie_list_item.dart';

class MovieSearchDelegate extends SearchDelegate {
  late Completer _completer = Completer();
  late final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 300),
      initialValue: '', onChanged: (value) {
    _completer.complete(searchChanged(value)); // look up the data
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length >= 3) {
      _debouncer.value = query;
      _completer = Completer();
      return FutureBuilder(
          future: _completer.future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].director),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieListItem(
                                      pageTitle:
                                          "Volume ${snapshot.data![index].volume.toString()}",
                                      greatMovie: snapshot.data![index])));
                        },
                      ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          });
    }
    return Container();
  }

  Future<List<GreatMovies>> searchChanged(String query) async {
    IGreatMoviesRepository greatMoviesRepository =
        locator<IGreatMoviesRepository>();
    return await greatMoviesRepository.searchMovies(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length >= 3) {
      _debouncer.value = query;
      _completer = Completer();
      return FutureBuilder(
          future: _completer.future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].director),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieListItem(
                                      pageTitle:
                                          "Volume ${snapshot.data![index].volume.toString()}",
                                      greatMovie: snapshot.data![index])));
                        },
                      ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          });
    }
    return Container();
  }
}

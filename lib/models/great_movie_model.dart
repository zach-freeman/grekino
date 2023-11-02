import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'great_movie_model.g.dart';

@DataClassName('GreatMovies')
class GreatMovieModel extends Table {
  @override
  String get tableName => "great_movies";
  TextColumn get id => text().named("Id")();
  TextColumn get name => text().named("Name")();
  TextColumn get director => text().named("Director")();
  IntColumn get volume => integer().named("Volume")();
  IntColumn get year => integer().named("Year")();
  TextColumn get genres => text().named("Genres")();
  BoolColumn get isCriterion => boolean().named("IsCriterion")();
  BoolColumn get isWatched => boolean().named("IsWatched")();
  TextColumn get dateWatched => text().named("DateWatched")();
  RealColumn get userStarRating => real().named("UserStarRating")();
  TextColumn get userReview => text().named("UserReview")();
}

@DriftDatabase(tables: [GreatMovieModel])
class GreatMovieDatabase extends _$GreatMovieDatabase {
  GreatMovieDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<GreatMovies>> moviesForVolume(int volume) {
    return (select(greatMovieModel)
          ..where((movie) => movie.volume.equals(volume)))
        .get();
  }

  Future updateMovie(String id) {
    return (update(greatMovieModel)..where((movie) => movie.id.equals(id)))
        .write(const GreatMovieModelCompanion(isWatched: Value(true)));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'GreatMoviesSQLite.db3'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/GreatMoviesSQLite.db3');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    return NativeDatabase.createInBackground(file);
  });
}

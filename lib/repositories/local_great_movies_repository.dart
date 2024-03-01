import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/repositories/i_local_great_movies_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalGreatMoviesRepository extends ILocalGreatMoviesRepository {
  late Future<Isar> db;

  LocalGreatMoviesRepository() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [GreatMovieModelSchema], // Here we will add a schema's
        directory: dir.path,
        inspector: true,
      );

      return isar;
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> insertAll(Stream<List<GreatMovieModel>> greatMovies) async {
    final isar = await db;
    final greatMovieList = await greatMovies.first;
    isar.writeTxn(() async {
      await isar.clear();
      for (GreatMovieModel greatMovie in greatMovieList) {
        await isar.greatMovieModels.put(greatMovie);
      }
    });
  }

  @override
  Future<void> insertMoviesForVolume(int volume, Stream<List<GreatMovieModel>> greatMovies) async {
    final isar = await db;
    final greatMovieList = await greatMovies.first;
    isar.writeTxn(() async {
      await isar.greatMovieModels.filter().volumeEqualTo(volume).deleteAll();
      for (GreatMovieModel greatMovie in greatMovieList) {
        await isar.greatMovieModels.put(greatMovie);
      }
    });
  }

  @override
  Stream<List<GreatMovieModel>> getMoviesForVolume(int volume) async* {
    final isar = await db;
    yield*  isar.greatMovieModels
        .filter()
        .volumeEqualTo(volume)
        .watch(fireImmediately: true);
  }

  @override
  Future<List<GreatMovieModel>> searchMovies(String searchTerm) async {
    final isar = await db;
    return await isar.greatMovieModels
        .filter()
        .nameContains(searchTerm)
        .or()
        .directorContains(searchTerm)
        .findAll();
  }
}
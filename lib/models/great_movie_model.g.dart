// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'great_movie_model.dart';

// ignore_for_file: type=lint
class $GreatMovieModelTable extends GreatMovieModel
    with TableInfo<$GreatMovieModelTable, GreatMovies> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GreatMovieModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'Id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'Name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _directorMeta =
      const VerificationMeta('director');
  @override
  late final GeneratedColumn<String> director = GeneratedColumn<String>(
      'Director', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<int> volume = GeneratedColumn<int>(
      'Volume', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'Year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumn<String> genres = GeneratedColumn<String>(
      'Genres', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCriterionMeta =
      const VerificationMeta('isCriterion');
  @override
  late final GeneratedColumn<bool> isCriterion = GeneratedColumn<bool>(
      'IsCriterion', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("IsCriterion" IN (0, 1))'));
  static const VerificationMeta _isWatchedMeta =
      const VerificationMeta('isWatched');
  @override
  late final GeneratedColumn<bool> isWatched = GeneratedColumn<bool>(
      'IsWatched', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("IsWatched" IN (0, 1))'));
  static const VerificationMeta _dateWatchedMeta =
      const VerificationMeta('dateWatched');
  @override
  late final GeneratedColumn<String> dateWatched = GeneratedColumn<String>(
      'DateWatched', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userStarRatingMeta =
      const VerificationMeta('userStarRating');
  @override
  late final GeneratedColumn<double> userStarRating = GeneratedColumn<double>(
      'UserStarRating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _userReviewMeta =
      const VerificationMeta('userReview');
  @override
  late final GeneratedColumn<String> userReview = GeneratedColumn<String>(
      'UserReview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        director,
        volume,
        year,
        genres,
        isCriterion,
        isWatched,
        dateWatched,
        userStarRating,
        userReview
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'great_movies';
  @override
  VerificationContext validateIntegrity(Insertable<GreatMovies> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('Id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['Id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('Name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['Name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('Director')) {
      context.handle(_directorMeta,
          director.isAcceptableOrUnknown(data['Director']!, _directorMeta));
    } else if (isInserting) {
      context.missing(_directorMeta);
    }
    if (data.containsKey('Volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['Volume']!, _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('Year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['Year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('Genres')) {
      context.handle(_genresMeta,
          genres.isAcceptableOrUnknown(data['Genres']!, _genresMeta));
    } else if (isInserting) {
      context.missing(_genresMeta);
    }
    if (data.containsKey('IsCriterion')) {
      context.handle(
          _isCriterionMeta,
          isCriterion.isAcceptableOrUnknown(
              data['IsCriterion']!, _isCriterionMeta));
    } else if (isInserting) {
      context.missing(_isCriterionMeta);
    }
    if (data.containsKey('IsWatched')) {
      context.handle(_isWatchedMeta,
          isWatched.isAcceptableOrUnknown(data['IsWatched']!, _isWatchedMeta));
    } else if (isInserting) {
      context.missing(_isWatchedMeta);
    }
    if (data.containsKey('DateWatched')) {
      context.handle(
          _dateWatchedMeta,
          dateWatched.isAcceptableOrUnknown(
              data['DateWatched']!, _dateWatchedMeta));
    } else if (isInserting) {
      context.missing(_dateWatchedMeta);
    }
    if (data.containsKey('UserStarRating')) {
      context.handle(
          _userStarRatingMeta,
          userStarRating.isAcceptableOrUnknown(
              data['UserStarRating']!, _userStarRatingMeta));
    } else if (isInserting) {
      context.missing(_userStarRatingMeta);
    }
    if (data.containsKey('UserReview')) {
      context.handle(
          _userReviewMeta,
          userReview.isAcceptableOrUnknown(
              data['UserReview']!, _userReviewMeta));
    } else if (isInserting) {
      context.missing(_userReviewMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  GreatMovies map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GreatMovies(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Name'])!,
      director: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Director'])!,
      volume: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Volume'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Year'])!,
      genres: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Genres'])!,
      isCriterion: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}IsCriterion'])!,
      isWatched: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}IsWatched'])!,
      dateWatched: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}DateWatched'])!,
      userStarRating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}UserStarRating'])!,
      userReview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}UserReview'])!,
    );
  }

  @override
  $GreatMovieModelTable createAlias(String alias) {
    return $GreatMovieModelTable(attachedDatabase, alias);
  }
}

class GreatMovies extends DataClass implements Insertable<GreatMovies> {
  final String id;
  final String name;
  final String director;
  final int volume;
  final int year;
  final String genres;
  final bool isCriterion;
  final bool isWatched;
  final String dateWatched;
  final double userStarRating;
  final String userReview;
  const GreatMovies(
      {required this.id,
      required this.name,
      required this.director,
      required this.volume,
      required this.year,
      required this.genres,
      required this.isCriterion,
      required this.isWatched,
      required this.dateWatched,
      required this.userStarRating,
      required this.userReview});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['Id'] = Variable<String>(id);
    map['Name'] = Variable<String>(name);
    map['Director'] = Variable<String>(director);
    map['Volume'] = Variable<int>(volume);
    map['Year'] = Variable<int>(year);
    map['Genres'] = Variable<String>(genres);
    map['IsCriterion'] = Variable<bool>(isCriterion);
    map['IsWatched'] = Variable<bool>(isWatched);
    map['DateWatched'] = Variable<String>(dateWatched);
    map['UserStarRating'] = Variable<double>(userStarRating);
    map['UserReview'] = Variable<String>(userReview);
    return map;
  }

  GreatMovieModelCompanion toCompanion(bool nullToAbsent) {
    return GreatMovieModelCompanion(
      id: Value(id),
      name: Value(name),
      director: Value(director),
      volume: Value(volume),
      year: Value(year),
      genres: Value(genres),
      isCriterion: Value(isCriterion),
      isWatched: Value(isWatched),
      dateWatched: Value(dateWatched),
      userStarRating: Value(userStarRating),
      userReview: Value(userReview),
    );
  }

  factory GreatMovies.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GreatMovies(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      director: serializer.fromJson<String>(json['director']),
      volume: serializer.fromJson<int>(json['volume']),
      year: serializer.fromJson<int>(json['year']),
      genres: serializer.fromJson<String>(json['genres']),
      isCriterion: serializer.fromJson<bool>(json['isCriterion']),
      isWatched: serializer.fromJson<bool>(json['isWatched']),
      dateWatched: serializer.fromJson<String>(json['dateWatched']),
      userStarRating: serializer.fromJson<double>(json['userStarRating']),
      userReview: serializer.fromJson<String>(json['userReview']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'director': serializer.toJson<String>(director),
      'volume': serializer.toJson<int>(volume),
      'year': serializer.toJson<int>(year),
      'genres': serializer.toJson<String>(genres),
      'isCriterion': serializer.toJson<bool>(isCriterion),
      'isWatched': serializer.toJson<bool>(isWatched),
      'dateWatched': serializer.toJson<String>(dateWatched),
      'userStarRating': serializer.toJson<double>(userStarRating),
      'userReview': serializer.toJson<String>(userReview),
    };
  }

  GreatMovies copyWith(
          {String? id,
          String? name,
          String? director,
          int? volume,
          int? year,
          String? genres,
          bool? isCriterion,
          bool? isWatched,
          String? dateWatched,
          double? userStarRating,
          String? userReview}) =>
      GreatMovies(
        id: id ?? this.id,
        name: name ?? this.name,
        director: director ?? this.director,
        volume: volume ?? this.volume,
        year: year ?? this.year,
        genres: genres ?? this.genres,
        isCriterion: isCriterion ?? this.isCriterion,
        isWatched: isWatched ?? this.isWatched,
        dateWatched: dateWatched ?? this.dateWatched,
        userStarRating: userStarRating ?? this.userStarRating,
        userReview: userReview ?? this.userReview,
      );
  @override
  String toString() {
    return (StringBuffer('GreatMovies(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('director: $director, ')
          ..write('volume: $volume, ')
          ..write('year: $year, ')
          ..write('genres: $genres, ')
          ..write('isCriterion: $isCriterion, ')
          ..write('isWatched: $isWatched, ')
          ..write('dateWatched: $dateWatched, ')
          ..write('userStarRating: $userStarRating, ')
          ..write('userReview: $userReview')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, director, volume, year, genres,
      isCriterion, isWatched, dateWatched, userStarRating, userReview);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GreatMovies &&
          other.id == this.id &&
          other.name == this.name &&
          other.director == this.director &&
          other.volume == this.volume &&
          other.year == this.year &&
          other.genres == this.genres &&
          other.isCriterion == this.isCriterion &&
          other.isWatched == this.isWatched &&
          other.dateWatched == this.dateWatched &&
          other.userStarRating == this.userStarRating &&
          other.userReview == this.userReview);
}

class GreatMovieModelCompanion extends UpdateCompanion<GreatMovies> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> director;
  final Value<int> volume;
  final Value<int> year;
  final Value<String> genres;
  final Value<bool> isCriterion;
  final Value<bool> isWatched;
  final Value<String> dateWatched;
  final Value<double> userStarRating;
  final Value<String> userReview;
  final Value<int> rowid;
  const GreatMovieModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.director = const Value.absent(),
    this.volume = const Value.absent(),
    this.year = const Value.absent(),
    this.genres = const Value.absent(),
    this.isCriterion = const Value.absent(),
    this.isWatched = const Value.absent(),
    this.dateWatched = const Value.absent(),
    this.userStarRating = const Value.absent(),
    this.userReview = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GreatMovieModelCompanion.insert({
    required String id,
    required String name,
    required String director,
    required int volume,
    required int year,
    required String genres,
    required bool isCriterion,
    required bool isWatched,
    required String dateWatched,
    required double userStarRating,
    required String userReview,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        director = Value(director),
        volume = Value(volume),
        year = Value(year),
        genres = Value(genres),
        isCriterion = Value(isCriterion),
        isWatched = Value(isWatched),
        dateWatched = Value(dateWatched),
        userStarRating = Value(userStarRating),
        userReview = Value(userReview);
  static Insertable<GreatMovies> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? director,
    Expression<int>? volume,
    Expression<int>? year,
    Expression<String>? genres,
    Expression<bool>? isCriterion,
    Expression<bool>? isWatched,
    Expression<String>? dateWatched,
    Expression<double>? userStarRating,
    Expression<String>? userReview,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (director != null) 'Director': director,
      if (volume != null) 'Volume': volume,
      if (year != null) 'Year': year,
      if (genres != null) 'Genres': genres,
      if (isCriterion != null) 'IsCriterion': isCriterion,
      if (isWatched != null) 'IsWatched': isWatched,
      if (dateWatched != null) 'DateWatched': dateWatched,
      if (userStarRating != null) 'UserStarRating': userStarRating,
      if (userReview != null) 'UserReview': userReview,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GreatMovieModelCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? director,
      Value<int>? volume,
      Value<int>? year,
      Value<String>? genres,
      Value<bool>? isCriterion,
      Value<bool>? isWatched,
      Value<String>? dateWatched,
      Value<double>? userStarRating,
      Value<String>? userReview,
      Value<int>? rowid}) {
    return GreatMovieModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      director: director ?? this.director,
      volume: volume ?? this.volume,
      year: year ?? this.year,
      genres: genres ?? this.genres,
      isCriterion: isCriterion ?? this.isCriterion,
      isWatched: isWatched ?? this.isWatched,
      dateWatched: dateWatched ?? this.dateWatched,
      userStarRating: userStarRating ?? this.userStarRating,
      userReview: userReview ?? this.userReview,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['Id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['Name'] = Variable<String>(name.value);
    }
    if (director.present) {
      map['Director'] = Variable<String>(director.value);
    }
    if (volume.present) {
      map['Volume'] = Variable<int>(volume.value);
    }
    if (year.present) {
      map['Year'] = Variable<int>(year.value);
    }
    if (genres.present) {
      map['Genres'] = Variable<String>(genres.value);
    }
    if (isCriterion.present) {
      map['IsCriterion'] = Variable<bool>(isCriterion.value);
    }
    if (isWatched.present) {
      map['IsWatched'] = Variable<bool>(isWatched.value);
    }
    if (dateWatched.present) {
      map['DateWatched'] = Variable<String>(dateWatched.value);
    }
    if (userStarRating.present) {
      map['UserStarRating'] = Variable<double>(userStarRating.value);
    }
    if (userReview.present) {
      map['UserReview'] = Variable<String>(userReview.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GreatMovieModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('director: $director, ')
          ..write('volume: $volume, ')
          ..write('year: $year, ')
          ..write('genres: $genres, ')
          ..write('isCriterion: $isCriterion, ')
          ..write('isWatched: $isWatched, ')
          ..write('dateWatched: $dateWatched, ')
          ..write('userStarRating: $userStarRating, ')
          ..write('userReview: $userReview, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$GreatMovieDatabase extends GeneratedDatabase {
  _$GreatMovieDatabase(QueryExecutor e) : super(e);
  late final $GreatMovieModelTable greatMovieModel =
      $GreatMovieModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [greatMovieModel];
}

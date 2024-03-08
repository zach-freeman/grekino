// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'great_movie_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGreatMovieModelCollection on Isar {
  IsarCollection<GreatMovieModel> get greatMovieModels => this.collection();
}

const GreatMovieModelSchema = CollectionSchema(
  name: r'GreatMovieModel',
  id: 8833913525770327630,
  properties: {
    r'dateWatched': PropertySchema(
      id: 0,
      name: r'dateWatched',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'director': PropertySchema(
      id: 2,
      name: r'director',
      type: IsarType.string,
    ),
    r'genres': PropertySchema(
      id: 3,
      name: r'genres',
      type: IsarType.stringList,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.string,
    ),
    r'imdbId': PropertySchema(
      id: 5,
      name: r'imdbId',
      type: IsarType.string,
    ),
    r'isCriterion': PropertySchema(
      id: 6,
      name: r'isCriterion',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 7,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'isWatched': PropertySchema(
      id: 8,
      name: r'isWatched',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'posterImageUrl': PropertySchema(
      id: 10,
      name: r'posterImageUrl',
      type: IsarType.string,
    ),
    r'userReview': PropertySchema(
      id: 11,
      name: r'userReview',
      type: IsarType.string,
    ),
    r'userStarRating': PropertySchema(
      id: 12,
      name: r'userStarRating',
      type: IsarType.double,
    ),
    r'volume': PropertySchema(
      id: 13,
      name: r'volume',
      type: IsarType.long,
    ),
    r'year': PropertySchema(
      id: 14,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _greatMovieModelEstimateSize,
  serialize: _greatMovieModelSerialize,
  deserialize: _greatMovieModelDeserialize,
  deserializeProp: _greatMovieModelDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _greatMovieModelGetId,
  getLinks: _greatMovieModelGetLinks,
  attach: _greatMovieModelAttach,
  version: '3.1.0+1',
);

int _greatMovieModelEstimateSize(
  GreatMovieModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dateWatched;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.director;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.genres;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imdbId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.posterImageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userReview;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _greatMovieModelSerialize(
  GreatMovieModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dateWatched);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.director);
  writer.writeStringList(offsets[3], object.genres);
  writer.writeString(offsets[4], object.id);
  writer.writeString(offsets[5], object.imdbId);
  writer.writeBool(offsets[6], object.isCriterion);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeBool(offsets[8], object.isWatched);
  writer.writeString(offsets[9], object.name);
  writer.writeString(offsets[10], object.posterImageUrl);
  writer.writeString(offsets[11], object.userReview);
  writer.writeDouble(offsets[12], object.userStarRating);
  writer.writeLong(offsets[13], object.volume);
  writer.writeLong(offsets[14], object.year);
}

GreatMovieModel _greatMovieModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GreatMovieModel(
    dateWatched: reader.readStringOrNull(offsets[0]),
    description: reader.readStringOrNull(offsets[1]),
    director: reader.readStringOrNull(offsets[2]),
    genres: reader.readStringList(offsets[3]),
    id: reader.readStringOrNull(offsets[4]),
    imdbId: reader.readStringOrNull(offsets[5]),
    isCriterion: reader.readBoolOrNull(offsets[6]),
    isSynced: reader.readBoolOrNull(offsets[7]) ?? true,
    isWatched: reader.readBoolOrNull(offsets[8]),
    name: reader.readStringOrNull(offsets[9]),
    posterImageUrl: reader.readStringOrNull(offsets[10]),
    userReview: reader.readStringOrNull(offsets[11]),
    userStarRating: reader.readDoubleOrNull(offsets[12]),
    volume: reader.readLongOrNull(offsets[13]),
    year: reader.readLongOrNull(offsets[14]),
  );
  return object;
}

P _greatMovieModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _greatMovieModelGetId(GreatMovieModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _greatMovieModelGetLinks(GreatMovieModel object) {
  return [];
}

void _greatMovieModelAttach(
    IsarCollection<dynamic> col, Id id, GreatMovieModel object) {}

extension GreatMovieModelQueryWhereSort
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QWhere> {
  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GreatMovieModelQueryWhere
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QWhereClause> {
  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GreatMovieModelQueryFilter
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QFilterCondition> {
  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateWatched',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateWatched',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateWatched',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateWatched',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateWatched',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateWatched',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateWatched',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateWatched',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateWatched',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateWatched',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateWatched',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      dateWatchedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateWatched',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'director',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'director',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'director',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'director',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'director',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      directorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'director',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genres',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genres',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genres',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genres',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genres',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genres',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      genresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imdbId',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imdbId',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imdbId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imdbId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imdbId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imdbId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imdbId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imdbId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imdbId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imdbId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imdbId',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      imdbIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imdbId',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isCriterionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCriterion',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isCriterionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCriterion',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isCriterionEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCriterion',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isWatchedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWatched',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isWatchedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWatched',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isWatchedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'posterImageUrl',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'posterImageUrl',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'posterImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'posterImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'posterImageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'posterImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'posterImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'posterImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'posterImageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      posterImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'posterImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userReview',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userReview',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userReview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userReview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userReview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userReview',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userReview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userReview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userReview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userReview',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userReview',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userReviewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userReview',
        value: '',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userStarRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userStarRating',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userStarRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userStarRating',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userStarRatingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userStarRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userStarRatingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userStarRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userStarRatingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userStarRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      userStarRatingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userStarRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      volumeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'volume',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      volumeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'volume',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      volumeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      volumeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      volumeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      volumeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      yearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterFilterCondition>
      yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GreatMovieModelQueryObject
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QFilterCondition> {}

extension GreatMovieModelQueryLinks
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QFilterCondition> {}

extension GreatMovieModelQuerySortBy
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QSortBy> {
  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByDateWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateWatched', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByDateWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateWatched', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByDirector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByDirectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> sortByImdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imdbId', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByImdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imdbId', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByIsCriterion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCriterion', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByIsCriterionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCriterion', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByIsWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatched', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByIsWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatched', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByPosterImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterImageUrl', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByPosterImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterImageUrl', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByUserReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userReview', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByUserReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userReview', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByUserStarRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userStarRating', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByUserStarRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userStarRating', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> sortByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension GreatMovieModelQuerySortThenBy
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QSortThenBy> {
  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByDateWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateWatched', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByDateWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateWatched', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByDirector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByDirectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> thenByImdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imdbId', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByImdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imdbId', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByIsCriterion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCriterion', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByIsCriterionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCriterion', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByIsWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatched', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByIsWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatched', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByPosterImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterImageUrl', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByPosterImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterImageUrl', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByUserReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userReview', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByUserReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userReview', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByUserStarRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userStarRating', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByUserStarRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userStarRating', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> thenByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QAfterSortBy>
      thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension GreatMovieModelQueryWhereDistinct
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> {
  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByDateWatched({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateWatched', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> distinctByDirector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'director', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> distinctByGenres() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genres');
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> distinctByImdbId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imdbId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByIsCriterion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCriterion');
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByIsWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWatched');
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByPosterImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posterImageUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByUserReview({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userReview', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct>
      distinctByUserStarRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userStarRating');
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> distinctByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volume');
    });
  }

  QueryBuilder<GreatMovieModel, GreatMovieModel, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension GreatMovieModelQueryProperty
    on QueryBuilder<GreatMovieModel, GreatMovieModel, QQueryProperty> {
  QueryBuilder<GreatMovieModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations>
      dateWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateWatched');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations> directorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'director');
    });
  }

  QueryBuilder<GreatMovieModel, List<String>?, QQueryOperations>
      genresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genres');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations> imdbIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imdbId');
    });
  }

  QueryBuilder<GreatMovieModel, bool?, QQueryOperations> isCriterionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCriterion');
    });
  }

  QueryBuilder<GreatMovieModel, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<GreatMovieModel, bool?, QQueryOperations> isWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWatched');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations>
      posterImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posterImageUrl');
    });
  }

  QueryBuilder<GreatMovieModel, String?, QQueryOperations>
      userReviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userReview');
    });
  }

  QueryBuilder<GreatMovieModel, double?, QQueryOperations>
      userStarRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userStarRating');
    });
  }

  QueryBuilder<GreatMovieModel, int?, QQueryOperations> volumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volume');
    });
  }

  QueryBuilder<GreatMovieModel, int?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}

// Mocks generated by Mockito 5.4.4 from annotations
// in grekino/integration_test/app_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:grekino/models/great_movie_model.dart' as _i4;
import 'package:grekino/providers/i_great_movies_provider.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [IGreatMoviesProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGreatMoviesProvider extends _i1.Mock
    implements _i2.IGreatMoviesProvider {
  @override
  _i3.Future<_i4.GreatMovieModel?> getMovieForId(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieForId,
          [id],
        ),
        returnValue: _i3.Future<_i4.GreatMovieModel?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.GreatMovieModel?>.value(),
      ) as _i3.Future<_i4.GreatMovieModel?>);

  @override
  _i3.Future<_i4.GreatMovieModel?> getMovieForImdbId(String? imdbId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieForImdbId,
          [imdbId],
        ),
        returnValue: _i3.Future<_i4.GreatMovieModel?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.GreatMovieModel?>.value(),
      ) as _i3.Future<_i4.GreatMovieModel?>);

  @override
  _i3.Stream<List<_i4.GreatMovieModel>> getMoviesForVolume(int? volume) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMoviesForVolume,
          [volume],
        ),
        returnValue: _i3.Stream<List<_i4.GreatMovieModel>>.empty(),
        returnValueForMissingStub:
            _i3.Stream<List<_i4.GreatMovieModel>>.empty(),
      ) as _i3.Stream<List<_i4.GreatMovieModel>>);

  @override
  _i3.Future<List<_i4.GreatMovieModel>> searchMovies(String? searchTerm) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [searchTerm],
        ),
        returnValue: _i3.Future<List<_i4.GreatMovieModel>>.value(
            <_i4.GreatMovieModel>[]),
        returnValueForMissingStub: _i3.Future<List<_i4.GreatMovieModel>>.value(
            <_i4.GreatMovieModel>[]),
      ) as _i3.Future<List<_i4.GreatMovieModel>>);

  @override
  _i3.Future<void> updateGreatMovie(_i4.GreatMovieModel? greatMovie) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateGreatMovie,
          [greatMovie],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

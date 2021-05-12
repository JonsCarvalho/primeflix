// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MovieController = BindInject(
  (i) => MovieController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_MovieControllerBase.loading'))
      .value;

  final _$moviesControllerStateAtom =
      Atom(name: '_MovieControllerBase.moviesControllerState');

  @override
  MoviesControllerState get moviesControllerState {
    _$moviesControllerStateAtom.reportRead();
    return super.moviesControllerState;
  }

  @override
  set moviesControllerState(MoviesControllerState value) {
    _$moviesControllerStateAtom.reportWrite(value, super.moviesControllerState,
        () {
      super.moviesControllerState = value;
    });
  }

  final _$movieModelAtom = Atom(name: '_MovieControllerBase.movieModel');

  @override
  MovieModel get movieModel {
    _$movieModelAtom.reportRead();
    return super.movieModel;
  }

  @override
  set movieModel(MovieModel value) {
    _$movieModelAtom.reportWrite(value, super.movieModel, () {
      super.movieModel = value;
    });
  }

  final _$movieUserModelAtom =
      Atom(name: '_MovieControllerBase.movieUserModel');

  @override
  MovieUserModel get movieUserModel {
    _$movieUserModelAtom.reportRead();
    return super.movieUserModel;
  }

  @override
  set movieUserModel(MovieUserModel value) {
    _$movieUserModelAtom.reportWrite(value, super.movieUserModel, () {
      super.movieUserModel = value;
    });
  }

  final _$getMoviesAsyncAction = AsyncAction('_MovieControllerBase.getMovies');

  @override
  Future getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  final _$watchLaterAsyncAction =
      AsyncAction('_MovieControllerBase.watchLater');

  @override
  Future watchLater() {
    return _$watchLaterAsyncAction.run(() => super.watchLater());
  }

  final _$watchedAsyncAction = AsyncAction('_MovieControllerBase.watched');

  @override
  Future watched() {
    return _$watchedAsyncAction.run(() => super.watched());
  }

  final _$favoriteAsyncAction = AsyncAction('_MovieControllerBase.favorite');

  @override
  Future favorite() {
    return _$favoriteAsyncAction.run(() => super.favorite());
  }

  final _$ratingAsyncAction = AsyncAction('_MovieControllerBase.rating');

  @override
  Future rating(int note) {
    return _$ratingAsyncAction.run(() => super.rating(note));
  }

  final _$_MovieControllerBaseActionController =
      ActionController(name: '_MovieControllerBase');

  @override
  dynamic setMovie(dynamic value) {
    final _$actionInfo = _$_MovieControllerBaseActionController.startAction(
        name: '_MovieControllerBase.setMovie');
    try {
      return super.setMovie(value);
    } finally {
      _$_MovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMovieUser(dynamic value) {
    final _$actionInfo = _$_MovieControllerBaseActionController.startAction(
        name: '_MovieControllerBase.setMovieUser');
    try {
      return super.setMovieUser(value);
    } finally {
      _$_MovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviesControllerState: ${moviesControllerState},
movieModel: ${movieModel},
movieUserModel: ${movieUserModel},
loading: ${loading}
    ''';
  }
}

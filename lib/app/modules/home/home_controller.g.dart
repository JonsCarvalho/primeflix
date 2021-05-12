// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_HomeControllerBase.loading'))
      .value;

  final _$userAtom = Atom(name: '_HomeControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$getMoviesStateAtom = Atom(name: '_HomeControllerBase.getMoviesState');

  @override
  GetMoviesState get getMoviesState {
    _$getMoviesStateAtom.reportRead();
    return super.getMoviesState;
  }

  @override
  set getMoviesState(GetMoviesState value) {
    _$getMoviesStateAtom.reportWrite(value, super.getMoviesState, () {
      super.getMoviesState = value;
    });
  }

  final _$pageControllerAtom = Atom(name: '_HomeControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$listMoviesAtom = Atom(name: '_HomeControllerBase.listMovies');

  @override
  ObservableList<MovieModel> get listMovies {
    _$listMoviesAtom.reportRead();
    return super.listMovies;
  }

  @override
  set listMovies(ObservableList<MovieModel> value) {
    _$listMoviesAtom.reportWrite(value, super.listMovies, () {
      super.listMovies = value;
    });
  }

  final _$listRecentMoviesAtom =
      Atom(name: '_HomeControllerBase.listRecentMovies');

  @override
  ObservableList<MovieModel> get listRecentMovies {
    _$listRecentMoviesAtom.reportRead();
    return super.listRecentMovies;
  }

  @override
  set listRecentMovies(ObservableList<MovieModel> value) {
    _$listRecentMoviesAtom.reportWrite(value, super.listRecentMovies, () {
      super.listRecentMovies = value;
    });
  }

  final _$getMoviesAsyncAction = AsyncAction('_HomeControllerBase.getMovies');

  @override
  Future getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  final _$getRecentMoviesAsyncAction =
      AsyncAction('_HomeControllerBase.getRecentMovies');

  @override
  Future getRecentMovies() {
    return _$getRecentMoviesAsyncAction.run(() => super.getRecentMovies());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setPageController(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPageController');
    try {
      return super.setPageController(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNavigatorController(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setNavigatorController');
    try {
      return super.setNavigatorController(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMovies(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMovies');
    try {
      return super.setMovies(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUser(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRecentMovies(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setRecentMovies');
    try {
      return super.setRecentMovies(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
getMoviesState: ${getMoviesState},
pageController: ${pageController},
listMovies: ${listMovies},
listRecentMovies: ${listRecentMovies},
loading: ${loading}
    ''';
  }
}

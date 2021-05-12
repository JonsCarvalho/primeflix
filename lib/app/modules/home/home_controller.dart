import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeflix/app/modules/login/login_controller.dart';
import 'package:primeflix/app/shared/models/movie_model.dart';
import 'package:primeflix/app/shared/models/user_model.dart';

import 'components/navigation_bar/navigation_bar_controller.dart';
import 'movies_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final navigationBarController = Modular.get<NavigationBarController>();
  final loginController = Modular.get<LoginController>();
  final moviesRepository = Modular.get<MoviesRepository>();

  @computed
  bool get loading => getMoviesState == GetMoviesState.LOADING;

  @observable
  UserModel user;

  @observable
  GetMoviesState getMoviesState = GetMoviesState.LOADING;

  @observable
  PageController pageController;

  @observable
  ObservableList<MovieModel> listMovies;

  @observable
  ObservableList<MovieModel> listRecentMovies;

  _HomeControllerBase() {
    getMovies();
    getRecentMovies();
  }

  @action
  setPageController(value) => pageController.jumpToPage(value);

  @action
  setNavigatorController(value) {
    navigationBarController.navagationComponentClick(value);
  }

  @action
  setMovies(value) => listMovies = value;

  @action
  setUser(value) => user = value;

  @action
  getMovies() async {
    getMoviesState = GetMoviesState.LOADING;

    var result = await moviesRepository.getMovies();

    if (result.statusCode != 200) {
      getMoviesState = GetMoviesState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.data != null) {
      List<MovieModel> list = [];
      result.data.forEach((m) {
        list.add(MovieModel.fromJson(m));
      });

      setMovies(list.asObservable());
      getMoviesState = GetMoviesState.SUCCESS;
    }
  }

  @action
  setRecentMovies(value) => listRecentMovies = value;

  @action
  getRecentMovies() async {
    getMoviesState = GetMoviesState.LOADING;

    var result = await moviesRepository.getRecentMovies();

    if (result.statusCode != 200) {
      getMoviesState = GetMoviesState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.data != null) {
      List<MovieModel> list = [];
      result.data.forEach((m) {
        list.add(MovieModel.fromJson(m));
      });

      setRecentMovies(list.asObservable());
      getMoviesState = GetMoviesState.SUCCESS;
    }
  }
}

enum GetMoviesState { IDLE, SUCCESS, FAIL, LOADING }

import 'package:cool_alert/cool_alert.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeflix/app/modules/home/home_controller.dart';
import 'package:primeflix/app/modules/home/movies_repository.dart';
import 'package:primeflix/app/shared/models/movie_model.dart';
import 'package:primeflix/app/shared/models/movie_user_model.dart';

import 'movie_repository.dart';

part 'movie_controller.g.dart';

@Injectable()
class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final homeController = Modular.get<HomeController>();
  final movieRepository = Modular.get<MovieRepository>();

  @computed
  bool get loading => moviesControllerState == MoviesControllerState.LOADING;

  @observable
  MoviesControllerState moviesControllerState = MoviesControllerState.IDLE;

  @observable
  MovieModel movieModel;

  @observable
  MovieUserModel movieUserModel;

  @action
  setMovie(value) => movieModel = value;

  @action
  setMovieUser(value) => movieUserModel = value;

  @action
  getMovies() async {
    moviesControllerState = MoviesControllerState.LOADING;

    try {
      var result =
          await movieRepository.getUserMovies(userId: homeController.user.id);

      if (result.statusCode != 200) {
        moviesControllerState = MoviesControllerState.FAIL;
        // Utils.handleOperationException(context, result.exception);
      }

      if (result.statusCode == 200) {
        List<MovieUserModel> list = [];
        result.data.forEach((m) {
          list.add(MovieUserModel.fromJson(m));
        });

        MovieUserModel movie;

        for (int i = 0; i < list.length; i++) {
          if (list[i].id == movieModel.id) {
            movie = list[i];
          }
        }

        setMovieUser(movie);

        moviesControllerState = MoviesControllerState.SUCCESS;
      }
    } catch (e) {
      await watchLater();
    }
  }

  @action
  watchLater() async {
    moviesControllerState = MoviesControllerState.LOADING;

    var result = await movieRepository.watchLater(
        userId: homeController.user.id, movieId: movieModel.id);

    if (result.statusCode != 200) {
      moviesControllerState = MoviesControllerState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.statusCode == 200) {
      await getMovies();
      moviesControllerState = MoviesControllerState.SUCCESS;
    }
  }

  @action
  watched() async {
    moviesControllerState = MoviesControllerState.LOADING;

    var result = await movieRepository.watched(
        userId: homeController.user.id, movieId: movieModel.id);

    if (result.statusCode != 200) {
      moviesControllerState = MoviesControllerState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.statusCode == 200) {
      await getMovies();
      await homeController.getUser();
      moviesControllerState = MoviesControllerState.SUCCESS;
    }
  }

  @action
  favorite() async {
    moviesControllerState = MoviesControllerState.LOADING;

    var result = await movieRepository.favorite(
        userId: homeController.user.id,
        movieId: movieModel.id,
        favorite: movieUserModel != null
            ? movieUserModel.favorite == 1
                ? 0
                : 1
            : 1);

    if (result.statusCode != 200) {
      moviesControllerState = MoviesControllerState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.statusCode == 200) {
      await getMovies();
      moviesControllerState = MoviesControllerState.SUCCESS;
    }
  }

  @action
  rating(int note) async {
    moviesControllerState = MoviesControllerState.LOADING;

    var result = await movieRepository.rating(
        userId: homeController.user.id, movieId: movieModel.id, note: note);

    if (result.statusCode != 200) {
      moviesControllerState = MoviesControllerState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.statusCode == 200) {
      await getMovies();
      moviesControllerState = MoviesControllerState.SUCCESS;
    }
  }
}

enum MoviesControllerState { IDLE, SUCCESS, FAIL, LOADING }

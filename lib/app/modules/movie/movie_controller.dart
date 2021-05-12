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

    var result =
        await movieRepository.getUserMovies(userId: homeController.user.id);

    if (result.statusCode != 200) {
      moviesControllerState = MoviesControllerState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.data != null) {
      List<MovieUserModel> list = [];
      result.data.forEach((m) {
        list.add(MovieUserModel.fromJson(m));
      });

      setMovieUser(list.asObservable());
      moviesControllerState = MoviesControllerState.SUCCESS;
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
}

enum MoviesControllerState { IDLE, SUCCESS, FAIL, LOADING }

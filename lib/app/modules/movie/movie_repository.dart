import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

part 'movie_repository.g.dart';

@Injectable()
class MovieRepository extends Disposable {
  final DioForNative client;

  MovieRepository(this.client);

  Future<Response> watchLater({@required movieId, @required userId}) async {
    final response = await client.post(
      '/filme_usuario',
      data: {
        'fk_filme_id': movieId,
        'fk_usuario_id': userId,
        'assistido': 0,
        'favorito': 0,
      },
    );
    return response;
  }

  Future<Response> watched({@required movieId, @required userId}) async {
    final response = await client.put(
      '/filme_usuario',
      data: {
        'fk_filme_id': movieId,
        'fk_usuario_id': userId,
        'assistido': 1,
        'data': DateTime.now().toString(),
      },
    );
    return response;
  }

  Future<Response> favorite(
      {@required movieId, @required userId, @required favorite}) async {
    final response = await client.put(
      '/filme_usuario',
      data: {
        'fk_filme_id': movieId,
        'fk_usuario_id': userId,
        'favorito': favorite,
      },
    );
    return response;
  }

  Future<Response> rating(
      {@required movieId, @required userId, @required note}) async {
    final response = await client.put(
      '/filme_usuario',
      data: {
        'fk_filme_id': movieId,
        'fk_usuario_id': userId,
        'nota': note,
      },
    );
    return response;
  }

  Future<Response> getUserMovies({@required userId}) async {
    final response = await client.get(
      '/filme_usuario/$userId',
    );
    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

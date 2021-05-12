import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

part 'movies_repository.g.dart';

@Injectable()
class MoviesRepository extends Disposable {
  final DioForNative client;

  MoviesRepository(this.client);

  Future<Response> getMovies() async {
    final response = await client.get('/filme');
    return response;
  }

  Future<Response> getRecentMovies() async {
    final response = await client.get('/filmes_recentes');
    return response;
  }

  Future<Response> getUser({@required userId}) async {
    final response = await client.get('/usuario/$userId');
    return response;
  }

  Future<Response> deleteUser({@required userId}) async {
    final response = await client.delete('/usuario/$userId');
    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

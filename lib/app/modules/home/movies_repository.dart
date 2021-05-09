import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

part 'movies_repository.g.dart';

@Injectable()
class MoviesRepository extends Disposable {
  final DioForNative client;

  MoviesRepository(this.client);

  Future<Response> getMovies({email, password}) async {
    final response = await client.get('/filme');
    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

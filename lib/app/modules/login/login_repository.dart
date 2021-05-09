import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

part 'login_repository.g.dart';

@Injectable()
class LoginRepository extends Disposable {
  final DioForNative client;

  LoginRepository(this.client);

  Future<Response> login({email, password}) async {
    final response = await client.post(
      '/login',
      data: {
        'email': email,
        'senha': password,
      },
    );
    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

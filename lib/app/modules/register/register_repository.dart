import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

part 'register_repository.g.dart';

@Injectable()
class RegisterRepository extends Disposable {
  final DioForNative client;

  RegisterRepository(this.client);

  Future<Response> register({
    @required name,
    @required email,
    @required password,
  }) async {
    final response = await client.post(
      '/usuario',
      data: {
        'email': email,
        'nome': name,
        'senha': password,
        'confirma_senha': password,
      },
    );
    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

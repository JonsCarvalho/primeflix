import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

part 'register_repository.g.dart';

@Injectable()
class RegisterRepository extends Disposable {
  final DioForNative client;

  RegisterRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

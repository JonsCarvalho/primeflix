import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'input_login_controller.dart';
import 'login_repository.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var loginClient = InputLoginController();
  final loginRepository = Modular.get<LoginRepository>();

  @computed
  bool get loading => loginState == LoginState.LOADING;

  @observable
  LoginState loginState;

  @action
  signInWithEmailAndPassword(email, password, context) async {
    loginState = LoginState.LOADING;

    var result = await loginRepository.login(email: email, password: password);

    if (result.statusCode == 400) {
      loginState = LoginState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    } else if (result.statusCode != 200) {
      loginState = LoginState.FAIL;
      // Utils.handleOperationException(context, result.exception);
    }

    if (result.data != null) {
      // savingUserInSharedPreferences(result.data);

      // String authToken = await SharedPreferencesUtils.getAuthToken();

      // graph.GraphQLClient graphQLClientUpdated =
      //     GraphQLApi.getClientUpdatingToken(authToken).value;
      // graph.GraphQLProvider.of(context).value = graphQLClientUpdated;

      loginState = LoginState.SUCCESS_CUSTOMER;

      Modular.to.pushReplacementNamed('/home');
    }
  }
}

enum LoginState {
  IDLE,
  SUCCESS_CUSTOMER,
  SUCCESS_REGISTER_CUSTOMER,
  SUCCESS_CUSTOMER_NOT_REGISTERED,
  FAIL,
  LOADING
}

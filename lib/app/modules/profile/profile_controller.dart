import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeflix/app/modules/home/home_controller.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final homeController = Modular.get<HomeController>();

  @observable
  bool isLoading = false;

  @action
  delete(context) async {
    isLoading = true;

    try {
      var result = await homeController.moviesRepository
          .deleteUser(userId: homeController.user.id);

      if (result.statusCode != 204) {
        isLoading = false;

        return CoolAlert.show(
          context: context,
          title: 'Erro!',
          confirmBtnColor: Theme.of(context).primaryColor,
          borderRadius: 15,
          type: CoolAlertType.error,
          text: 'Usuário não deletado, ocorreu um erro.',
          onConfirmBtnTap: () async {
            Modular.to.pop();
          },
        );
      }

      if (result.statusCode == 204) {
        Modular.to.pop();
        Modular.to.pushReplacementNamed('/login');
      }
    } catch (e) {
      isLoading = false;
      return CoolAlert.show(
        context: context,
        title: 'Erro!',
        confirmBtnColor: Theme.of(context).primaryColor,
        borderRadius: 15,
        type: CoolAlertType.error,
        text: 'Usuário não deletado, ocorreu um erro.',
        onConfirmBtnTap: () async {
          Modular.to.pop();
        },
      );
    }
  }
}

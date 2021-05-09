// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_bar_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NavigationBarController = BindInject(
  (i) => NavigationBarController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationBarController on _NavigationBarBase, Store {
  final _$indexComponentSelectedAtom =
      Atom(name: '_NavigationBarBase.indexComponentSelected');

  @override
  int get indexComponentSelected {
    _$indexComponentSelectedAtom.reportRead();
    return super.indexComponentSelected;
  }

  @override
  set indexComponentSelected(int value) {
    _$indexComponentSelectedAtom
        .reportWrite(value, super.indexComponentSelected, () {
      super.indexComponentSelected = value;
    });
  }

  final _$_NavigationBarBaseActionController =
      ActionController(name: '_NavigationBarBase');

  @override
  dynamic navagationComponentClick(int index) {
    final _$actionInfo = _$_NavigationBarBaseActionController.startAction(
        name: '_NavigationBarBase.navagationComponentClick');
    try {
      return super.navagationComponentClick(index);
    } finally {
      _$_NavigationBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexComponentSelected: ${indexComponentSelected}
    ''';
  }
}

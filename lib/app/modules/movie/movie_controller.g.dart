// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MovieController = BindInject(
  (i) => MovieController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$valueAtom = Atom(name: '_MovieControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_MovieControllerBaseActionController =
      ActionController(name: '_MovieControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MovieControllerBaseActionController.startAction(
        name: '_MovieControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}

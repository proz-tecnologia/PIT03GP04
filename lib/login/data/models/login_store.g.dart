// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$nameUserAtom =
      Atom(name: '_LoginStore.nameUser', context: context);

  @override
  String get nameUser {
    _$nameUserAtom.reportRead();
    return super.nameUser;
  }

  @override
  set nameUser(String value) {
    _$nameUserAtom.reportWrite(value, super.nameUser, () {
      super.nameUser = value;
    });
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setNameUser(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setNameUser');
    try {
      return super.setNameUser(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameUser: ${nameUser}
    ''';
  }
}

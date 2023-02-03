// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$_loginStoreAtom =
      Atom(name: 'UserStoreBase._loginStore', context: context);

  LoginStore? get loginStore {
    _$_loginStoreAtom.reportRead();
    return super._loginStore;
  }

  @override
  LoginStore? get _loginStore => loginStore;

  @override
  set _loginStore(LoginStore? value) {
    _$_loginStoreAtom.reportWrite(value, super._loginStore, () {
      super._loginStore = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  dynamic loadPerson(LoginStore loginStore) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.loadPerson');
    try {
      return super.loadPerson(loginStore);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

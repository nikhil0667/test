// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$isVisibleAtom = Atom(
    name: '_AuthStore.isVisible',
    context: context,
  );

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$isConfirmVisibleAtom = Atom(
    name: '_AuthStore.isConfirmVisible',
    context: context,
  );

  @override
  bool get isConfirmVisible {
    _$isConfirmVisibleAtom.reportRead();
    return super.isConfirmVisible;
  }

  @override
  set isConfirmVisible(bool value) {
    _$isConfirmVisibleAtom.reportWrite(value, super.isConfirmVisible, () {
      super.isConfirmVisible = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_AuthStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_AuthStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$userAtom = Atom(name: '_AuthStore.user', context: context);

  @override
  BaseResponse<User>? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(BaseResponse<User>? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loginAsyncAction = AsyncAction(
    '_AuthStore.login',
    context: context,
  );

  @override
  Future<dynamic> login(LoginRequestModel request, BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(request, context));
  }

  late final _$signUpAsyncAction = AsyncAction(
    '_AuthStore.signUp',
    context: context,
  );

  @override
  Future<dynamic> signUp(SignUpRequestModel request, BuildContext context) {
    return _$signUpAsyncAction.run(() => super.signUp(request, context));
  }

  late final _$logoutAsyncAction = AsyncAction(
    '_AuthStore.logout',
    context: context,
  );

  @override
  Future<dynamic> logout(UserLogout request, BuildContext context) {
    return _$logoutAsyncAction.run(() => super.logout(request, context));
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isConfirmVisible: ${isConfirmVisible},
isLoading: ${isLoading},
error: ${error},
user: ${user}
    ''';
  }
}

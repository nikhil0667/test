// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStore, Store {
  late final _$isVisibleAtom = Atom(
    name: '_ChatStore.isVisible',
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

  late final _$isLoadingAtom = Atom(
    name: '_ChatStore.isLoading',
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

  late final _$isLeftAtom = Atom(name: '_ChatStore.isLeft', context: context);

  @override
  bool get isLeft {
    _$isLeftAtom.reportRead();
    return super.isLeft;
  }

  @override
  set isLeft(bool value) {
    _$isLeftAtom.reportWrite(value, super.isLeft, () {
      super.isLeft = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ChatStore.error', context: context);

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

  late final _$onlineMemberListAtom = Atom(
    name: '_ChatStore.onlineMemberList',
    context: context,
  );

  @override
  ObservableList<OnlineMember> get onlineMemberList {
    _$onlineMemberListAtom.reportRead();
    return super.onlineMemberList;
  }

  @override
  set onlineMemberList(ObservableList<OnlineMember> value) {
    _$onlineMemberListAtom.reportWrite(value, super.onlineMemberList, () {
      super.onlineMemberList = value;
    });
  }

  late final _$recentChatListAtom = Atom(
    name: '_ChatStore.recentChatList',
    context: context,
  );

  @override
  ObservableList<RecentChat> get recentChatList {
    _$recentChatListAtom.reportRead();
    return super.recentChatList;
  }

  @override
  set recentChatList(ObservableList<RecentChat> value) {
    _$recentChatListAtom.reportWrite(value, super.recentChatList, () {
      super.recentChatList = value;
    });
  }

  late final _$getChatListAsyncAction = AsyncAction(
    '_ChatStore.getChatList',
    context: context,
  );

  @override
  Future<dynamic> getChatList() {
    return _$getChatListAsyncAction.run(() => super.getChatList());
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isLoading: ${isLoading},
isLeft: ${isLeft},
error: ${error},
onlineMemberList: ${onlineMemberList},
recentChatList: ${recentChatList}
    ''';
  }
}

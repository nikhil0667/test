// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$isVisibleAtom = Atom(
    name: '_HomeStore.isVisible',
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
    name: '_HomeStore.isLoading',
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

  late final _$errorAtom = Atom(name: '_HomeStore.error', context: context);

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

  late final _$tasksAtom = Atom(name: '_HomeStore.tasks', context: context);

  @override
  Tasks? get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(Tasks? value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$getTasksListAsyncAction = AsyncAction(
    '_HomeStore.getTasksList',
    context: context,
  );

  @override
  Future<void> getTasksList({String? name}) {
    return _$getTasksListAsyncAction.run(() => super.getTasksList(name: name));
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isLoading: ${isLoading},
error: ${error},
tasks: ${tasks}
    ''';
  }
}

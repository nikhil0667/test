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

  late final _$isLeftAtom = Atom(name: '_HomeStore.isLeft', context: context);

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

  late final _$taskAtom = Atom(name: '_HomeStore.task', context: context);

  @override
  ObservableList<Task>? get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(ObservableList<Task>? value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$selectedTaskAtom = Atom(
    name: '_HomeStore.selectedTask',
    context: context,
  );

  @override
  ObservableList<Task>? get selectedTask {
    _$selectedTaskAtom.reportRead();
    return super.selectedTask;
  }

  @override
  set selectedTask(ObservableList<Task>? value) {
    _$selectedTaskAtom.reportWrite(value, super.selectedTask, () {
      super.selectedTask = value;
    });
  }

  late final _$getTasksListAsyncAction = AsyncAction(
    '_HomeStore.getTasksList',
    context: context,
  );

  @override
  Future<dynamic> getTasksList(String name) {
    return _$getTasksListAsyncAction.run(() => super.getTasksList(name));
  }

  late final _$_HomeStoreActionController = ActionController(
    name: '_HomeStore',
    context: context,
  );

  @override
  void getSelectedTasksList(DateTime date) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
      name: '_HomeStore.getSelectedTasksList',
    );
    try {
      return super.getSelectedTasksList(date);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isLoading: ${isLoading},
isLeft: ${isLeft},
error: ${error},
task: ${task},
selectedTask: ${selectedTask}
    ''';
  }
}

import 'package:mobx/mobx.dart';
import 'package:test_architecture/data/remote/task_api.dart';

import '../../../core/api/base_response/base_response.dart';
import '../../../core/locator/locator.dart';
import '../../../data/model/response/tasks.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final TaskApi taskApi = locator<TaskApi>();

  @observable
  bool isVisible = false;
  @observable
  bool isLoading = false;

  @observable
  String error = "";
  @observable
  Tasks? tasks;

  @action
  Future<void> getTasksList({String? name}) async {
    try {
      isLoading = true;
      BaseResponse<Tasks> res = await taskApi.getTaskList(name ?? "left");

      tasks = res.data;
      print("DATA  $tasks");
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}

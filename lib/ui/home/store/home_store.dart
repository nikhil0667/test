import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:test_architecture/data/remote/task_api.dart';

import '../../../core/api/base_response/base_response.dart';
import '../../../core/exceptions/dio_exception_util.dart';
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
  bool isLeft = true;

  @observable
  String error = "";
  @observable
  ObservableList<Task>? task = ObservableList();
  @observable
  ObservableList<Task>? selectedTask = ObservableList();

  @action
  Future getTasksList(String name) async {
    try {
      error = "";
      isLoading = true;
      BaseResponse<Tasks> response = await taskApi.getTaskList(name);

      if (response.code == "200") {
        task = ObservableList.of(response.data?.tasks as Iterable<Task>);
        selectedTask = task;
      }
    } on DioException catch (e) {
      error = DioExceptionUtil.handleError(e);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  void getSelectedTasksList(DateTime date) {
    isLoading = true;

    selectedTask = ObservableList.of(
      task!.where((e) {
        return e.dueDate?.day == date.day &&
            e.dueDate?.month == date.month &&
            e.dueDate?.year == date.year;
      }).toList(),
    );

    isLoading = false;
  }
}

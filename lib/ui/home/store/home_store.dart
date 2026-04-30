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

  @action
  Future getTasksList({String? name}) async {
    try {
      error = "";
      isLoading = true;
      BaseResponse<Tasks> response = await taskApi.getTaskList(name ?? "left");

      if (response.code == "200") {
        task = ObservableList.of(response.data?.tasks as Iterable<Task>);
      }
    } on DioException catch (e) {
      error = DioExceptionUtil.handleError(e);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}

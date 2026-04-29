import 'package:test_architecture/core/api/base_response/base_response.dart';
import 'package:test_architecture/core/exceptions/dio_exception_util.dart';
import 'package:test_architecture/core/locator/locator.dart';
import 'package:test_architecture/data/model/response/tasks.dart';
import 'package:test_architecture/data/remote/task_api.dart';
import 'package:test_architecture/data/repository/task_repo.dart';
import 'package:test_architecture/ui/home/store/home_store.dart';

class TaskRepoImpl extends TaskRepo {
  TaskApi taskApi;

  TaskRepoImpl({required this.taskApi});

  @override
  Future<BaseResponse<Tasks>> getTaskList(String type) async {
    try {
      return await taskApi.getTaskList(type);
    } on DioExceptionUtil catch (e) {
      locator<HomeStore>().error = e.toString();
    } catch (e) {
      locator<HomeStore>().error = e.toString();
      rethrow;
    }
    throw Exception("Something Went Wrong");
  }
}

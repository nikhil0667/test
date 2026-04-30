import 'package:test_architecture/core/api/base_response/base_response.dart';
import 'package:test_architecture/data/model/response/tasks.dart';
import 'package:test_architecture/data/remote/task_api.dart';
import 'package:test_architecture/data/repository/task_repo.dart';

class TaskRepoImpl extends TaskRepo {
  TaskApi taskApi;

  TaskRepoImpl({required this.taskApi});

  @override
  Future<BaseResponse<Tasks>> getTaskList(String type) async {
    return await taskApi.getTaskList(type);
}}

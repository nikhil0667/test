import 'package:test_architecture/core/api/base_response/base_response.dart';

import '../model/response/tasks.dart';

abstract class TaskRepo {
  Future<BaseResponse<Tasks>> getTaskList(String type);
}

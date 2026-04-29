import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_architecture/data/model/response/tasks.dart';

import '../../core/api/base_response/base_response.dart';

part 'task_api.g.dart';

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio) = _TaskApi;

  @GET("/tasks/list?type={type}")
  Future<BaseResponse<Tasks>> getTaskList(@Path("type") String type);

}

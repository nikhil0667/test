import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_architecture/data/model/response/users.dart';

import '../../core/api/base_response/base_response.dart';
import '../model/request/login_request_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("/tasks/login")
  Future<BaseResponse<Users>> signIn(@Body() LoginRequestModel request);
}

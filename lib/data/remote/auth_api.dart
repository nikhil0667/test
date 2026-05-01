import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_architecture/data/model/request/sign_up_request_model.dart';
import 'package:test_architecture/data/model/request/user_logout.dart';
import 'package:test_architecture/data/model/response/user.dart';

import '../../core/api/base_response/base_response.dart';
import '../model/request/login_request_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("/tasks/login")
  Future<BaseResponse<User>> signIn(@Body() LoginRequestModel request);

  @POST("/tasks/signup")
  Future<BaseResponse<User>> signUp(@Body() SignUpRequestModel request);
  @POST("/tasks/logout")
  Future<BaseResponse> logout(@Body() UserLogout request);


}

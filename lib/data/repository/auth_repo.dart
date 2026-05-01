import 'package:test_architecture/core/api/base_response/base_response.dart';
import 'package:test_architecture/data/model/request/user_logout.dart';
import 'package:test_architecture/data/model/response/user.dart';

import '../model/request/login_request_model.dart';
import '../model/request/sign_up_request_model.dart';

abstract class AuthRepository {
  Future<BaseResponse<User>?> signIn(LoginRequestModel request);

  Future<BaseResponse<User>> signUp(SignUpRequestModel request);

  Future<BaseResponse> logout(UserLogout request);
}

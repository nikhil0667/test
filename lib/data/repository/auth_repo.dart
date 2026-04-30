import 'package:test_architecture/core/api/base_response/base_response.dart';
import 'package:test_architecture/data/model/response/users.dart';

import '../model/request/login_request_model.dart';
import '../model/request/sign_up_request_model.dart';

abstract class AuthRepository {
  Future<BaseResponse<Users>?> signIn(LoginRequestModel request);

  Future<BaseResponse<Users>> signUp(SignUpRequestModel request);
}

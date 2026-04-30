import 'package:test_architecture/data/model/request/sign_up_request_model.dart';

import '../../core/api/base_response/base_response.dart';
import '../../core/locator/locator.dart';
import '../model/request/login_request_model.dart';
import '../model/response/users.dart';
import '../remote/auth_api.dart';
import '../repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepository {
  AuthApi authApi;

  AuthRepoImpl({required this.authApi});

  @override
  Future<BaseResponse<Users>> signIn(LoginRequestModel request) async {
    final BaseResponse<Users> res = await authApi.signIn(request);
    return res;
  }

  @override
  Future<BaseResponse<Users>> signUp(SignUpRequestModel request) async {
    final BaseResponse<Users> res = await authApi.signUp(request);
    return res;
  }
}

final authRepo = locator<AuthRepoImpl>();

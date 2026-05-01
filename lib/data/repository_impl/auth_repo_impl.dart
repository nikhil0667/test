import 'package:test_architecture/data/model/request/sign_up_request_model.dart';
import 'package:test_architecture/data/model/request/user_logout.dart';

import '../../core/api/base_response/base_response.dart';
import '../../core/locator/locator.dart';
import '../model/request/login_request_model.dart';
import '../model/response/user.dart';
import '../remote/auth_api.dart';
import '../repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepository {
  AuthApi authApi;

  AuthRepoImpl({required this.authApi});

  @override
  Future<BaseResponse<User>> signIn(LoginRequestModel request) async {
    final BaseResponse<User> res = await authApi.signIn(request);
    return res;
  }

  @override
  Future<BaseResponse<User>> signUp(SignUpRequestModel request) async {
    final BaseResponse<User> res = await authApi.signUp(request);
    return res;
  }

  @override
  Future<BaseResponse> logout(UserLogout request) async{
    final BaseResponse res = await authApi.logout(request);
    return res;
  }
}

final authRepo = locator<AuthRepoImpl>();

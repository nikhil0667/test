import 'package:test_architecture/core/exceptions/dio_exception_util.dart';
import 'package:test_architecture/ui/auth/store/auth_store.dart';

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
  Future<BaseResponse<Users>?> signIn(LoginRequestModel request) async {
   try{
      return await authApi.signIn(request);
    } on DioExceptionUtil catch(e)  {
      locator<AuthStore>().error = e.toString();
    } catch (e) {

     locator<AuthStore>().error = e.toString();
      rethrow;
    }
   return null;
  }
}

final authRepo = locator<AuthRepoImpl>();

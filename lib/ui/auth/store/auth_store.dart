import 'package:mobx/mobx.dart';
import 'package:test_architecture/core/api/base_response/base_response.dart';
import 'package:test_architecture/core/exceptions/dio_exception_util.dart';
import 'package:test_architecture/data/model/request/login_request_model.dart';
import 'package:test_architecture/data/model/response/users.dart';
import 'package:test_architecture/data/repository_impl/auth_repo_impl.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool isVisible = false;
  @observable
  bool isLoading = false;

  @observable
  String error = "";
  @observable
  User? user;

  @action
  Future<bool?> login(LoginRequestModel req) async {
    BaseResponse<Users>? res;

    try {
      isLoading = true;
      res = await authRepo.signIn(req);

      user = res?.data?.user;
      return res?.code == "200" ? true : false;
    } on DioExceptionUtil catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
    return false;
  }
}

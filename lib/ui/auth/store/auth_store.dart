import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:test_architecture/core/exceptions/dio_exception_util.dart';
import 'package:test_architecture/data/model/request/login_request_model.dart';
import 'package:test_architecture/data/model/request/sign_up_request_model.dart';
import 'package:test_architecture/data/model/response/users.dart';

import '../../../core/api/base_response/base_response.dart';
import '../../../data/repository_impl/auth_repo_impl.dart';
import '../../../router/app_router.dart';
import '../../../widget/message.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool isVisible = false;

  @observable
  bool isConfirmVisible = false;

  @observable
  bool isLoading = false;

  @observable
  String error = "";
  @observable
  BaseResponse<Users>? user;

  @action
  Future login(LoginRequestModel request, BuildContext context) async {
    try {
      BaseResponse<Users> response = await authRepo.signIn(request);
      error = "";
      isLoading = true;
      print("I MAGE ${response.message}");
      print("I MAGE ${response.data?.user}");

      if (response.code == "200") {
        print("I MAGE ${response.data}");
        print("I MAGE ${response.code}");

        user = response;

        context.router.push(HomeRoute());
        Message.showMessage(context, "Login Successfully");
      } else {
        Message.showMessage(context, response.message!);
      }
    } on DioException catch (e) {
      error = DioExceptionUtil.handleError(e);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future signUp(SignUpRequestModel request) async {
    try {
      BaseResponse response = await authRepo.signUp(request);
      error = "";
      isLoading = true;
      print("I MAGE ${response.message}");

      print("I MAGE ${response.data}");
      print("I MAGE ${response.code}");
      if (response.code == "200") {
        user = response as BaseResponse<Users>?;
      }
    } on DioException catch (e) {
      error = DioExceptionUtil.handleError(e);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}

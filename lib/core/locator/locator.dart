import 'package:get_it/get_it.dart';
import 'package:test_architecture/data/remote/auth_api.dart';
import 'package:test_architecture/data/remote/task_api.dart';
import 'package:test_architecture/data/repository_impl/auth_repo_impl.dart';
import 'package:test_architecture/data/repository_impl/task_repo_impl.dart';
import 'package:test_architecture/ui/auth/store/auth_store.dart';
import 'package:test_architecture/ui/home/store/home_store.dart';

import '../api/api_module.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<ApiModule>(ApiModule());
  locator.registerSingleton<AuthApi>(AuthApi(locator<ApiModule>().dio));
  locator.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(authApi: locator<AuthApi>()),
  );
  locator.registerSingleton(AuthStore());

  /// Task List
  locator.registerSingleton<TaskApi>(TaskApi(locator<ApiModule>().dio));
  locator.registerSingleton<TaskRepoImpl>(
    TaskRepoImpl(taskApi: locator<TaskApi>()),
  );
  locator.registerSingleton(HomeStore());
}

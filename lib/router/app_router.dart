import 'package:auto_route/auto_route.dart';
import 'package:test_architecture/ui/splash/splash_page.dart';

import '../core/locator/locator.dart';
import '../ui/auth/login_page.dart';
import '../ui/home/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: false),
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page, initial: false),
  ];
}

final appRouter = locator<AppRouter>();

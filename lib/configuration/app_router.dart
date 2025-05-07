import 'package:auto_route/auto_route.dart';
import 'package:readingapps/configuration/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/", page: HomeSetupRoute.page, initial: true),
        AutoRoute(path: "/reading", page: ReadingSetupRoute.page),
        AutoRoute(path: "/fonics", page: FonicSetupRoute.page),
      ];
}

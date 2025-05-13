import 'package:auto_route/auto_route.dart';
import 'package:readingapps/configuration/app_router.gr.dart';

/// Configures the application's routing using AutoRoute.
///
/// This router defines the main navigation routes for the application,
/// specifying the initial route and the paths for different setup screens.
///
/// Uses Cupertino-style page transitions by default.
///
/// Routes include:
/// - Home setup (initial route at "/")
/// - Reading setup at "/reading"
/// - Fonics setup at "/fonics"
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

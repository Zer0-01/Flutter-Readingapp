// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:readingapps/presentation/fonic/fonic_setup_screen.dart' as _i1;
import 'package:readingapps/presentation/home/home_setup_screen.dart' as _i2;
import 'package:readingapps/presentation/reading/reading_setup_screen.dart'
    as _i3;

/// generated route for
/// [_i1.FonicSetupScreen]
class FonicSetupRoute extends _i4.PageRouteInfo<void> {
  const FonicSetupRoute({List<_i4.PageRouteInfo>? children})
    : super(FonicSetupRoute.name, initialChildren: children);

  static const String name = 'FonicSetupRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.FonicSetupScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeSetupScreen]
class HomeSetupRoute extends _i4.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i3.ReadingSetupScreen]
class ReadingSetupRoute extends _i4.PageRouteInfo<void> {
  const ReadingSetupRoute({List<_i4.PageRouteInfo>? children})
    : super(ReadingSetupRoute.name, initialChildren: children);

  static const String name = 'ReadingSetupRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ReadingSetupScreen();
    },
  );
}

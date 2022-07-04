// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_library/models/book.dart' as _i5;
import 'package:flutter_library/pages/detail_page.dart' as _i2;
import 'package:flutter_library/pages/main_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailPage(key: args.key, book: args.book));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MainRoute.name, path: '/'),
        _i3.RouteConfig(DetailRoute.name, path: '/detail-page')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.DetailPage]
class DetailRoute extends _i3.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i4.Key? key, required _i5.Book book})
      : super(DetailRoute.name,
            path: '/detail-page', args: DetailRouteArgs(key: key, book: book));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.book});

  final _i4.Key? key;

  final _i5.Book book;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, book: $book}';
  }
}

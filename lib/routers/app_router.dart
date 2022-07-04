import 'package:auto_route/auto_route.dart';
import 'package:flutter_library/pages/main_page.dart';
import 'package:flutter_library/pages/detail_page.dart';

// allows strongly-typed arguments passing and simplifies routes setup
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: false,
  routes: <AutoRoute>[
    // defines a route
    AutoRoute(initial: true, page: MainPage),
    AutoRoute(page: DetailPage),
  ],
)
// allows to create generated file of routes
class $AppRouter {}

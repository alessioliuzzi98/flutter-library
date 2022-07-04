import 'package:flutter/material.dart';
import 'package:flutter_library/di/dependency_injector.dart';
import 'package:flutter_library/misc/theme.dart';
import 'package:flutter_library/routers/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: MaterialApp.router(
        // disable the debug label on app
        debugShowCheckedModeBanner: false,
        // a delegate that is used by the Router widget to parse a route information into a configuration
        routeInformationParser: _router.defaultRouteParser(),
        // a delegate that is used by the Router widget to build and configure a navigating widget
        routerDelegate: _router.delegate(),
        title: AppLocalizations.of(context)?.app_name ?? '',
        // set custom light theme
        theme: CustomThemeData.lightThemeData(),
        // set custom dark theme
        darkTheme: CustomThemeData.darkThemeData(),
        // define supported locales
        supportedLocales: AppLocalizations.supportedLocales,
        // set the delegates for localizations
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}

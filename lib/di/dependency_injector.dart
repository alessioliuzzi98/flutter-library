import 'package:flutter_library/cubits/filter_cubit.dart';
import 'package:flutter_library/cubits/search_cubit.dart';
import 'package:flutter_library/cubits/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/blocs/main/main_bloc.dart';
import 'package:flutter_library/repositories/main_repository.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_library/services/rest_client.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';

part 'blocs.dart';

part 'repositories.dart';

part 'providers.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    Key? key,
    required this.child,
  }) : super(key: key);

  /* Engages MultiProvider containing Logger, Connectivity services etc
  to MultiBlocProvider containing blocs (_Blocs)
  to MultiRepositoryProvider containing repositories (_Repositories) */
  @override
  Widget build(BuildContext context) => _Providers(
        child: _Repositories(
          child: _Blocs(
            child: child,
          ),
        ),
      );
}

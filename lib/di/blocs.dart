part of 'dependency_injector.dart';

class _Blocs extends StatelessWidget {
  final Widget child;

  const _Blocs({
    Key? key,
    required this.child,
  }) : super(key: key);

  // the MultiBlocProvider allows to merge BlocProviders without needing to nest them
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(
              repository: context.read(),
              connectivity: context.read(),
              logger: context.read(),
            ),
          ),
          BlocProvider<SearchCubit>(
            create: (context) => SearchCubit(
              logger: context.read(),
            ),
          ),
          BlocProvider<WishlistCubit>(
            create: (context) => WishlistCubit(
              logger: context.read(),
            ),
          ),
          BlocProvider<FilterCubit>(
            create: (context) => FilterCubit(
              logger: context.read(),
            ),
          ),
        ],
        child: child,
      );
}

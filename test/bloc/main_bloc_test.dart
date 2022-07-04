import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_library/blocs/main/main_bloc.dart';
import 'package:flutter_library/models/book.dart';
import 'package:flutter_library/repositories/main_repository.dart';

import 'main_bloc_test.mocks.dart';

@GenerateMocks([
  Connectivity,
  Logger,
  MainRepository,
])
void main() {
  MainRepository? mainRepository;
  Connectivity? connectivity;
  Logger? logger;

  setUp(() {
    mainRepository = MockMainRepository();
    connectivity = MockConnectivity();
    logger = MockLogger();
  });

  blocTest<MainBloc, MainState>(
    ('test search with an empty string'),
    build: () {
      when(connectivity?.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      when(mainRepository!.storages()).thenAnswer((_) async => [
            Book(id: 0, name: "test1"),
            Book(id: 1, name: "test2"),
          ]);

      return MainBloc(
        repository: mainRepository!,
        connectivity: connectivity!,
        logger: logger!,
      );
    },
    act: (bloc) => bloc.fetchBooks(''),
    expect: () => [
      FetchingMainState(),
      isA<FetchedMainState>(),
    ],
  );

  blocTest<MainBloc, MainState>(
    ('test search with success'),
    build: () {
      when(connectivity?.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      when(mainRepository!.storages()).thenAnswer((_) async => [
            Book(id: 0, name: 'test1'),
            Book(id: 1, name: 'test2'),
          ]);

      return MainBloc(
        repository: mainRepository!,
        connectivity: connectivity!,
        logger: logger!,
      );
    },
    act: (bloc) => bloc.fetchBooks('test1'),
    expect: () => [
      FetchingMainState(),
      FetchedMainState(
        books: [
          Book(id: 0, name: 'test1')
        ],
      ),
    ],
  );

  blocTest<MainBloc, MainState>(
    ('test search with an unconnected device'),
    build: () {
      when(connectivity?.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      return MainBloc(
        repository: mainRepository!,
        connectivity: connectivity!,
        logger: logger!,
      );
    },
    act: (bloc) => bloc.fetchBooks(null),
    expect: () => [
      ErrorMainState(),
    ],
  );
}

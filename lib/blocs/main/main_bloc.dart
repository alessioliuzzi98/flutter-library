import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/cubits/wishlist_cubit.dart';
import 'package:flutter_library/models/book.dart';
import 'package:flutter_library/repositories/main_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository repository;

  /// The connectivity service
  final Connectivity connectivity;

  /// The logger service
  final Logger logger;

  MainBloc({
    required this.repository,
    required this.connectivity,
    required this.logger,
  }) : super(InitialMainState()) {
    on<FetchMainEvent>(_mapFetchMainEventToState);
  }

  void _mapFetchMainEventToState(
      FetchMainEvent event, Emitter<MainState> emit) async {
    ConnectivityResult connectionResult =
        await connectivity.checkConnectivity();

    if (connectionResult != ConnectivityResult.none) {
      emit(FetchingMainState());

      List<Book>? books;

      try {
        logger.d('Fetching books from storage');

        if (event.bookName != null && event.bookName != '') {
          List<Book>? tempBooks = await repository.storages();

          // Check the books that contain the searched name
          books = tempBooks
              ?.where((element) => element.name
                  .toLowerCase()
                  .contains(event.bookName!.toLowerCase()))
              .toList(growable: false);
        } else {
          books = await repository.storages();

          // Sort the book alphabetically
          books?.sort((a, b) {
            return a.name.compareTo(b.name);
          });
        }

        logger.d('Fetched books from storage');
      } on Exception catch (error) {
        logger.e('There was an error about fetching the data');
        emit(ErrorMainState());
      } finally {
        if (books != null) {
          emit(FetchedMainState(books: books));
        }
      }
    } else {
      logger.e('Internet is not available');
      emit(ErrorMainState());
    }
  }

  void fetchBooks(String? bookName) {
    add(FetchMainEvent(bookName: bookName));
  }
}

part of 'main_bloc.dart';

abstract class MainState extends Equatable {}

class InitialMainState extends MainState {
  @override
  List<Object?> get props => [];
}

class FetchingMainState extends MainState {
  @override
  List<Object?> get props => [];
}

class FetchedMainState extends MainState {
  final List<Book> books;

  FetchedMainState({required this.books});

  @override
  List<Object?> get props => [books];
}

class ErrorMainState extends MainState {
  @override
  List<Object?> get props => [];
}

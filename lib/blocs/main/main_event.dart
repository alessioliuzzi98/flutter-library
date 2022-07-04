part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {}

class FetchMainEvent extends MainEvent {
  String? bookName;
  bool? filterWishlist;

  FetchMainEvent({this.bookName, this.filterWishlist});

  @override
  List<Object?> get props => [bookName, filterWishlist];
}
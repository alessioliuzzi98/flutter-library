import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:flutter_library/models/book.dart';
import 'package:rxdart/rxdart.dart';

/// Wishlist cubit used to manage the wishlist
class WishlistCubit extends Cubit {
  /// The logger service
  final Logger logger;

  final BehaviorSubject<List<Book>> _wishlistSubject = BehaviorSubject();

  /// A getter to get the search stream
  Stream<List<Book>> get wishlistStream => _wishlistSubject.stream;

  /// WishlistCubit constructor
  WishlistCubit({required this.logger}) : super(false) {
    _wishlistSubject.value = [];
  }

  /// Method used to add to wishlist
  void addToWishlist(Book book) {
    _wishlistSubject.value.add(book);
    _wishlistSubject.sink.add(_wishlistSubject.value);

    logger.d('Added to wishlist');
  }

  /// Method used to remove from wishlist
  void removeFromWishlist(Book book) {
    _wishlistSubject.value.remove(book);
    _wishlistSubject.sink.add(_wishlistSubject.value);

    logger.d('Removed from wishlist');
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

enum Filter { wishlist, oneCopy, borrow }

/// Filter cubit used to filter the books
class FilterCubit extends Cubit<List<Filter>> {
  /// The logger service
  final Logger logger;

  /// FilterCubit constructor
  FilterCubit({required this.logger}) : super([]);

  /// Method used to enable the filter
  void toggleFilter(Filter type) {
    logger.d('Toggling filter');

    if (state.contains(type)) {
      state.remove(type);
    } else {
      state.add(type);
    }

    emit(state);
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/blocs/main/main_bloc.dart';
import 'package:flutter_library/cubits/search_cubit.dart';
import 'package:flutter_library/cubits/wishlist_cubit.dart';
import 'package:flutter_library/models/book.dart';
import 'package:flutter_library/widgets/items/book_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_library/cubits/filter_cubit.dart';
import 'package:flutter_library/routers/app_router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, bool>(
      builder: (context, isSearching) => Scaffold(
        resizeToAvoidBottomInset: false,
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: isSearching ? 1 : 0,
          title: isSearching ? _searchField(context) : null,
          automaticallyImplyLeading: isSearching,
          actions:
              isSearching ? _searchActions(context) : _defaultActions(context),
        ),
        body: _body(context),
      ),
    );
  }

  Widget _searchField(BuildContext context) => TextField(
        autofocus: true,
        controller: context.watch<SearchCubit>().searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppLocalizations.of(context)?.hint_search ?? '',
        ),
        onChanged: context.watch<SearchCubit>().updateSearchValue,
        onSubmitted: (value) {
          context.read<MainBloc>().fetchBooks(value);
          context.read<SearchCubit>().toggleSearch();
        },
      );

  List<Widget> _defaultActions(BuildContext context) => [
        BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          if (state is FetchingMainState) {
            return Container();
          } else {
            return BlocBuilder<FilterCubit, List<Filter>>(
              bloc: context.watch<FilterCubit>(),
              builder: (context, filterState) => Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    tooltip: AppLocalizations.of(context)?.tooltip_search ?? '',
                    onPressed: () => _startSearch(context),
                  ),
                  PopupMenuButton<int>(
                    // Callback that sets the selected popup menu item.
                    onSelected: (index) {
                      switch (index) {
                        case 0:
                          context
                              .read<FilterCubit>()
                              .toggleFilter(Filter.wishlist);
                          context.read<MainBloc>().fetchBooks(null);

                          break;
                        case 1:
                          context
                              .read<FilterCubit>()
                              .toggleFilter(Filter.oneCopy);
                          context.read<MainBloc>().fetchBooks(null);
                          break;
                        case 2:
                          context
                              .read<FilterCubit>()
                              .toggleFilter(Filter.borrow);
                          context.read<MainBloc>().fetchBooks(null);
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<int>>[
                      PopupMenuItem(
                        value: 0,
                        child: Text(
                          filterState.contains(Filter.wishlist)
                              ? 'Disable wishlist filter'
                              : 'Enable wishlist filter',
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Text(
                          filterState.contains(Filter.oneCopy)
                              ? 'Disable more than 1 copy filter'
                              : 'Enable more than 1 copy filter',
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          filterState.contains(Filter.borrow)
                              ? 'Disable borrow filter'
                              : 'Enable borrow filter',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        }),
      ];

  List<Widget> _searchActions(BuildContext context) => [
        StreamBuilder<String>(
          stream: context.watch<SearchCubit>().searchStream,
          builder: (context, snapshot) => IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                Navigator.pop(context);
                return;
              }
              context.read<SearchCubit>().cleanSearch();
            },
          ),
        )
      ];

  Widget _body(BuildContext context) {
    return StreamBuilder<List<Book>>(
      stream: context.watch<WishlistCubit>().wishlistStream,
      builder: (context, snapshot) => BlocBuilder<MainBloc, MainState>(
        bloc: context.watch<MainBloc>(),
        builder: (context, state) {
          if (state is FetchedMainState) {
            List<Book>? tempBooks;
            tempBooks = state.books;

            var filterState = context.read<FilterCubit>().state;

            if (filterState.contains(Filter.wishlist)) {
              tempBooks = tempBooks
                  .where((element) => snapshot.data?.contains(element) ?? false)
                  .toList(growable: false);
            }

            if (filterState.contains(Filter.oneCopy)) {
              tempBooks = tempBooks.where(
                (element) {
                  return (element.copies ?? 0) >= 1;
                },
              ).toList(growable: false);
            }

            return _booksList(context, tempBooks);
          } else {
            if (state is InitialMainState) {
              context.read<MainBloc>().fetchBooks(null);
            }

            return _progressIndicator(context);
          }
        },
      ),
    );
  }

  Widget _progressIndicator(BuildContext context) =>
      const Center(child: CircularProgressIndicator());

  Widget _booksList(BuildContext context, List<Book> books) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: books.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => context.router.push(
            DetailRoute(
              book: books[index],
            ),
          ),
          child: BookItem(
            book: books[index],
          ),
        ),
      );

  void _startSearch(BuildContext context) {
    ModalRoute.of(context)?.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: context.read<SearchCubit>().toggleSearch),
    );

    context.read<SearchCubit>().toggleSearch();
  }
}

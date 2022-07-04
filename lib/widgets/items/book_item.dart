import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/cubits/wishlist_cubit.dart';
import 'package:flutter_library/misc/book_util.dart';
import 'package:flutter_library/models/book.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Book>>(
        stream: context.watch<WishlistCubit>().wishlistStream,
        builder: (context, snapshot) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Image.network(BookUtil.bookImage),
                ),
                Container(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      book.author != null
                          ? Text(
                              book.author!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            )
                          : Container(),
                      Text(
                        book.name,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      book.copies != null
                          ? Text('Copies: ${book.copies}')
                          : Container(),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => snapshot.data?.contains(book) ?? false
                      ? context.read<WishlistCubit>().removeFromWishlist(book)
                      : context.read<WishlistCubit>().addToWishlist(book),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      snapshot.data?.contains(book) ?? false
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

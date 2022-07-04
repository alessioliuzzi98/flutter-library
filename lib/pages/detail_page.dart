import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/cubits/wishlist_cubit.dart';
import 'package:flutter_library/misc/book_util.dart';
import 'package:flutter_library/models/book.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: _body(context),
      );

  Widget _body(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 3;

    return Column(
      children: [
        Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Image.network(BookUtil.bookImage),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          book.name,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          book.author ?? '',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Number of copies: ${book.copies}',
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<List<Book>>(
              stream: context.watch<WishlistCubit>().wishlistStream,
              builder: (context, snapshot) => ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.green,
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(
                      10,
                    ),
                  ),
                ),
                child: const Text('Borrow book'),
                onPressed: () {
                  if (snapshot.data?.contains(book) == true) {
                    context.read<WishlistCubit>().removeFromWishlist(book);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Book borrowed"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.green,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(
                    10,
                  ),
                ),
              ),
              child: const Text('Extend load'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Load extended"),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

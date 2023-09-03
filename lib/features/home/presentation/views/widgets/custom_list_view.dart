import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  int nextPage = 1;
  bool isFetching = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels >=
              0.7 * notification.metrics.maxScrollExtent) {
            if (!isFetching) {
              isFetching = true;
              _fetchFeaturedBooks().then((value) {
                isFetching = false;
              });
            }
          }
          return false;
        },
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomBookItem(
            image: widget.books[index].image ?? '',
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          itemCount: widget.books.length,
        ),
      ),
    );
  }

  Future<void> _fetchFeaturedBooks() async {
    await BlocProvider.of<FeaturedBooksCubit>(context)
        .fetchFeaturedBooks(pageNumber: nextPage++);
  }
}

// class FeaturedBooksListView extends StatelessWidget {
//   const FeaturedBooksListView({super.key, required this.books});
//
//   final List<BookEntity> books;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.3,
//       child: ListView.separated(
//           physics: const BouncingScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => CustomBookItem(
//                 image: books[index].image ?? '',
//               ),
//           separatorBuilder: (context, index) => SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.04,
//               ),
//           itemCount: books.length),
//     );
//   }
// }

import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item_of_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView(
      {super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  int nextPage = 1;
  bool isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() async {
      final scrollPosition = _scrollController.position;
      final maxScrollExtent = scrollPosition.maxScrollExtent;
      final currentScrollExtent = scrollPosition.pixels;
      const threshold = 0.7; // 70% threshold

      if (currentScrollExtent >= maxScrollExtent * threshold) {
        if (!isFetching) {
          isFetching = true;
          await BlocProvider.of<NewestBooksCubit>(context)
              .fetchNewestBooks(pageNumber: nextPage++);
          isFetching = false;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return BestSellerItemOfListView(
              book: widget.books[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15.0,
            );
          },
          itemCount: widget.books.length),
    );
  }
}

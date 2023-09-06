import 'dart:developer';

import 'package:bookly_app/core/widgets/error_widget_toast.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_loading_indicator_newest_books/best_seller_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_list_view.dart';

class BestSellerListViewBlocConsumer extends StatefulWidget {
  const BestSellerListViewBlocConsumer({
    super.key,
  });

  @override
  State<BestSellerListViewBlocConsumer> createState() =>
      _BestSellerListViewBlocConsumerState();
}

class _BestSellerListViewBlocConsumerState
    extends State<BestSellerListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
        listener: (context, state) {
      if (state is NewestBooksSuccessState) {
        log(state.books.length.toString());
        setState(() {
          books.addAll(state.books);
        });
      } else if (state is NewestBooksFailureState) {
        CustomErrorAlert.showErrorAlert(
            errorMessage: state.error, context: context);
      }
    }, builder: (context, state) {
      if (state is NewestBooksSuccessState ||
          state is NewestBooksPaginationFailureState ||
          state is NewestBooksPaginationLoadingState) {
        return BestSellerListView(
          books: books,
        );
      } else if (state is NewestBooksPaginationFailureState) {
        return Center(
          child: Text(state.error.toString()),
        );
      } else {
        return const BestSellerListViewLoadingIndicator();
      }
    });
  }
}

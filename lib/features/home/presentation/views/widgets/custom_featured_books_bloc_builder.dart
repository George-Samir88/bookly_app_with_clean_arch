import 'package:bookly_app/core/widgets/error_widget_toast.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_loading_indicator/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'custom_list_view.dart';

class CustomFeaturedBookBlocConsumer extends StatefulWidget {
  const CustomFeaturedBookBlocConsumer({
    super.key,
  });

  @override
  State<CustomFeaturedBookBlocConsumer> createState() =>
      _CustomFeaturedBookBlocConsumerState();
}

class _CustomFeaturedBookBlocConsumerState
    extends State<CustomFeaturedBookBlocConsumer> {
  late List<BookEntity> books;

  @override
  void initState() {
    books = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccessState) {
        books.addAll(state.books);
      } else if (state is FeaturedBooksPaginationFailureState) {
        CustomErrorAlert.showErrorAlert(
            errorMessage: state.error, context: context);
      }
    }, builder: (BuildContext context, state) {
      if (state is FeaturedBooksSuccessState ||
          state is FeaturedBooksPaginationLoadingState ||
          state is FeaturedBooksPaginationFailureState) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailureState) {
        return Center(
          child: Text(state.error.toString()),
        );
      } else {
        return const FeaturedBooksListViewLoadingIndicator();
      }
    });
  }
}

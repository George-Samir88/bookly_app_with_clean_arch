import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view.dart';

class CustomFeaturedBookBlocBuilder extends StatelessWidget {
  const CustomFeaturedBookBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (BuildContext context, state) {
      if (state is FeaturedBooksSuccessState) {
        return const CustomListView();
      } else if (state is FeaturedBooksFailureState) {
        return Center(
          child: Text(state.error.toString()),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

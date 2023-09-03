import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'custom_book_item_loading_indicator.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              const CustomBookItemLoadingIndicator(),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10.0,
          ),
          itemCount: 15,
        ),
      ),
    );
  }
}

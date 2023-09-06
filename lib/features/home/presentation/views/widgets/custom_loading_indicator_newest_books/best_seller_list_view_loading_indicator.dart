import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_loading_indicator_newest_books/best_seller_item_of_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';

class BestSellerListViewLoadingIndicator extends StatelessWidget {
  const BestSellerListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0, left: 30.0),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const BestSellerItemOfListViewLoadingIndicator();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15.0,
              );
            },
            itemCount: 15),
      ),
    );
  }
}

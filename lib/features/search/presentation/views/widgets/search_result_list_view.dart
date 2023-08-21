import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item_of_list_view.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const BestSellerItemOfListView();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10.0,
          );
        },
        itemCount: 15);
  }
}

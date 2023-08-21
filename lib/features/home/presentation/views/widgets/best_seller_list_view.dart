import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item_of_list_view.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0),
      child: ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const BestSellerItemOfListView();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15.0,
            );
          },
          itemCount: 15),
    );
  }
}

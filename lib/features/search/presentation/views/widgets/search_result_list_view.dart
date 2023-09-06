import 'package:flutter/material.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          // return BestSellerItemOfListView(
          //   book: ,
          // );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10.0,
          );
        },
        itemCount: 15);
  }
}

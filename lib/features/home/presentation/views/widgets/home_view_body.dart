import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'custom_featured_books_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const CustomFeaturedBookBlocConsumer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    'Best Seller',
                    style: Styles.textStyle18,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: BestSellerListView(),
          // ), //when using sliverToBoxAdapter you are going to make listView shrinkWrap: true that's make listView create all item before showing which lose performance of app
          //replace sliverToBoxAdapter with SliverFillRemaining
          const SliverFillRemaining(
            child: BestSellerListViewBlocConsumer(),
          ),
        ],
      ),
    );
  }
}

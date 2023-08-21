import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                  ),
                ), // if screen max size sized box will be expanded
                SimilarBooksSection(),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

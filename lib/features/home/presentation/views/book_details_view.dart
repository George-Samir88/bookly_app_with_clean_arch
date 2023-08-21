import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customBookDetailsAppBar(),
        body: const BookDetailsViewBody(),
      ),
    );
  }
}


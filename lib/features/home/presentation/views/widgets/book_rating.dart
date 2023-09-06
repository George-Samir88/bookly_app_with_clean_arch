import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.bookRating});

  final MainAxisAlignment mainAxisAlignment;
  final int bookRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 16.0,
        ),
        const SizedBox(
          width: 6.3,
        ),
        const Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          '${bookRating.toInt()}',
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

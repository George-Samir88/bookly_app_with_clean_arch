import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextButton(
              text: '19.99',
              backGroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
              textStyle: Styles.textStyle18
                  .copyWith(fontWeight: FontWeight.w900, color: Colors.black),
            ),
          ),
          Expanded(
            child: CustomTextButton(
              text: 'Free Preview',
              backGroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              textStyle: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

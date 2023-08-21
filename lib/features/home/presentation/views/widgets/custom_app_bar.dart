import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          CustomAssets.logo,
          height: 22,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(
              AppRouter.searchViewPath,
            );
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22.0,
          ),
        ),
      ],
    );
  }
}

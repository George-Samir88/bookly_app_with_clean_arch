import 'package:flutter/material.dart';

AppBar customBookDetailsAppBar () => AppBar(
  leading: Padding(
    padding: const EdgeInsets.only(left: 30.0),
    child: IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: const Icon(Icons.close),
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
    )
  ],
);
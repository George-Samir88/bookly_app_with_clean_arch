import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class BestSellerItemOfListViewLoadingIndicator extends StatelessWidget {
  const BestSellerItemOfListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                color: Colors.grey[50],
              ),
            ),
          ),
          const SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16.0)
                  ),
                  height: 5.0,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 120
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5.0,
                    decoration: BoxDecoration(color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      width: 20.0,
                      height: 5.0,
                    ),
                    const Spacer(),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.grey[50],
                      size: 16.0,
                    ),
                    const SizedBox(
                      width: 6.3,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      width: 35.0,
                      height: 4.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  const CategoryItem({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16,),
        Container(
          margin: Constants.getCategoryNameMargin,
          child: Text(
            category,
            style: Constants.getCategoryNameStyle(),
          ),
        ),
        const SizedBox(height: 16,),
        Constants.getBetweenCategoryDivider(),
      ],
    );
  }
}

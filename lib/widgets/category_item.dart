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
        const SizedBox(height: 14,),
        Container(
          margin: const EdgeInsets.only(left: 34),
          child: Text(
            category,
            style: Constants.getCategoriesStyle(),
          ),
        ),
        const SizedBox(height: 14,),
        const Divider(
            indent: 34,
            endIndent: 34,
            thickness: 2,
            color :Colors.white60
        )
      ],
    );;
  }
}

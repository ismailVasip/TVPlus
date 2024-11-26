import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
class FilterCategory extends StatelessWidget {
  final String label;
  const FilterCategory({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 140,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white60,width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Constants.getMoviesStyle(),
          ),
          const SizedBox(width: 4,),
          const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              color:Colors.white
          )
        ],
      ),
    );
  }
}

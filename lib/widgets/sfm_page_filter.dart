import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class FilterWidget extends StatelessWidget {
  final String label;
  const FilterWidget({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height:45,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white60,width: 1),
          borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          label,
          style: Constants.getMoviesStyle(),
        ),
      ),
    );
  }
}

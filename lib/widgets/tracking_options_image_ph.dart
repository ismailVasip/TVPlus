import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class TrackingOptionsImagePh extends StatelessWidget {
  final model;
  const TrackingOptionsImagePh({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Constants.getTrackingOptImageBorderRadius,
      child: Image.asset(
        model.imagePath,
        fit: BoxFit.cover,
        height: 80,
        width: 120,
      ),
    );
  }
}

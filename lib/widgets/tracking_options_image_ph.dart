import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/models/movie_model.dart';

class TrackingOptionsImagePh extends StatelessWidget {
  final MovieModel movieModel;
  const TrackingOptionsImagePh({super.key,required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Constants.getTrackingOptImageBorderRadius,
      child: Image.asset(
        movieModel.imagePath,
        fit: BoxFit.cover,
        height: 80,
        width: 120,
      ),
    );
  }
}

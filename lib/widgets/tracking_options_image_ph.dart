import 'package:flutter/material.dart';
import 'package:tv_plus/models/movie_model.dart';

class TrackingOptionsImagePh extends StatelessWidget {
  final MovieModel movieModel;
  const TrackingOptionsImagePh({super.key,required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Image.asset(
        movieModel.image_path,
        fit: BoxFit.cover,
        height: 75,
        width: 120,
      ),
    );
  }
}

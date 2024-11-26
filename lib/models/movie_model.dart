import 'package:flutter/material.dart';
class MovieModel {
  final String movie_name;
  final List<String> categories;
  final String image_path;

  MovieModel({required this.movie_name, required this.categories, required this.image_path});

  @override
  String toString() {
    // TODO: implement toString
    return categories.join(" , ");
  }
}
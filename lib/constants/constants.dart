import 'package:flutter/material.dart';

class Constants{
  Constants._();

  static const String appBarTitle = "TV+";
  static  TextStyle getAppBarTitleStyle() {
    return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 36
    );
  }
  static  TextStyle getAppBarCategoryStyle() {
    return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 23
    );
  }
  static  TextStyle getMoviesStyle() {
    return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17
    );
  }
  static  TextStyle getCategoriesStyle() {
    return const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.normal,
        fontSize: 23
    );
  }
}
import 'package:flutter/material.dart';

class Constants{
  Constants._();

  static const Color getScaffoldBackgroundColor =  Color.fromRGBO(27, 31, 40, 1);
  static const EdgeInsets getCategoryNameMargin = EdgeInsets.only(left: 34);
  static const BorderRadius getPageViewImageBorderRadius = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius getTrackingOptImageBorderRadius = BorderRadius.all(Radius.circular(8.0));
  static const EdgeInsets getPageViewPadding = EdgeInsets.all(8.0);
  static const EdgeInsets getTrackingOptionsBodyPadding =  EdgeInsets.all(8.0);
  static const EdgeInsets getTrackingOptionsHeaderPadding =  EdgeInsets.all(16.0);
  static const EdgeInsets getPageViewIndicatorPadding =  EdgeInsets.symmetric(horizontal: 5.0);
  static const BorderRadius getPageViewIndicatorBorderRadius =  BorderRadius.all(Radius.circular(16.0));

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
  static  TextStyle getCategoryNameStyle() {
    return const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.normal,
        fontSize: 23
    );
  }
  static Divider getBetweenCategoryDivider(){
    return const Divider(
        indent: 34,
        endIndent: 34,
        thickness: 2,
        color :Colors.white60
    );
  }
}
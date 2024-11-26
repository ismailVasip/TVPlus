import 'package:flutter/material.dart';
import 'package:tv_plus/pages/home_page.dart';

void main() {
  runApp(const TVPlusApp());
}

class TVPlusApp extends StatelessWidget {
  const TVPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TV+ App",
      theme: ThemeData(
        scaffoldBackgroundColor:const Color.fromRGBO(27, 31, 40, 1),
        primarySwatch: Colors.blueGrey,
      ),
      home:const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/my_downloaded.dart';
import 'package:tv_plus/data/my_watching_list.dart';
import 'package:tv_plus/pages/home_page.dart';
import 'package:tv_plus/pages/my_downloads.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MyDownloadedMovies()),
      ChangeNotifierProvider(create: (_) => MyWatchingList()),
    ],
    child: const TVPlusApp(),
  ));
}

class TVPlusApp extends StatelessWidget {
  const TVPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TV+ App",
      theme: ThemeData(
        scaffoldBackgroundColor:Constants.getScaffoldBackgroundColor,
        primarySwatch: Colors.blueGrey,
        splashColor: Colors.transparent,//navbar anim
      ),
      home:const HomePage(),
    );
  }
}

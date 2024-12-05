import 'package:flutter/material.dart';
import 'package:tv_plus/widgets/classic_appbar.dart';
import 'package:tv_plus/widgets/my_list_item.dart';

class MyLists extends StatefulWidget {
  const MyLists({super.key});

  @override
  State<MyLists> createState() => _MyListsState();
}

class _MyListsState extends State<MyLists> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: ClassicAppbar(title: "LİSTELERİM"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyListItem(title: ListType.watchingList, isArrowForwardActive: false),
            MyListItem(title: ListType.recorded, isArrowForwardActive: true),
            MyListItem(title: ListType.favoriteChannels, isArrowForwardActive: false),
            MyListItem(title: ListType.willBeRecorded, isArrowForwardActive: true),
            MyListItem(title: ListType.willBeRecordedSeasons, isArrowForwardActive: true),
            MyListItem(title: ListType.rentAndBought, isArrowForwardActive: false),
            MyListItem(title: ListType.recordedSeasons, isArrowForwardActive: true),
          ],
        ),
      ),
    );
  }
}
enum ListType {
  watchingList,
  recorded,
  favoriteChannels,
  willBeRecorded,
  willBeRecordedSeasons,
  rentAndBought,
  recordedSeasons
}
import 'package:flutter/material.dart';
import 'package:tv_plus/pages/my_lists.dart';
import 'package:tv_plus/widgets/my_list_item_body.dart';
import 'package:tv_plus/widgets/my_list_item_header.dart';

class MyListItem extends StatelessWidget {
  final ListType title;
  final bool isArrowForwardActive;
  const MyListItem({
    super.key,
    required this.title,
    required this.isArrowForwardActive
  });

  @override
  Widget build(BuildContext context) {

    return switch (title) {
      ListType.watchingList => _buildColumn("İzleme Listem",false,ListType.watchingList),
      ListType.recorded => _buildColumn("Kaydettiklerim",true,ListType.recorded),
      ListType.favoriteChannels => _buildColumn("Favori Kanallarım",false,ListType.favoriteChannels),
      ListType.willBeRecorded => _buildColumn("Kaydedilecekler",true,ListType.willBeRecorded),
      ListType.willBeRecordedSeasons => _buildColumn("Kaydedilecek Sezonlar",true,ListType.willBeRecordedSeasons),
      ListType.rentAndBought => _buildColumn("Kiraladıklarım & Satın Aldıklarım",false,ListType.rentAndBought),
      ListType.recordedSeasons => _buildColumn("Kaydettiğim Sezonlar",true,ListType.recordedSeasons),
    };
  }
  _buildColumn(
      String titleString,bool isArrowForwardActive, ListType titleEnum
      ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyListItemHeader(title: titleString, isArrowForwardActive: isArrowForwardActive),
        MyListItemBody(title: titleEnum,)
      ],
    );
  }
}

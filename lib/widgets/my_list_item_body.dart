import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/my_watching_list.dart';
import 'package:tv_plus/models/movie_model.dart';
import 'package:tv_plus/pages/my_lists.dart';
import 'package:tv_plus/widgets/my_list_empty_content.dart';

class MyListItemBody extends StatelessWidget {
  final title;
  const MyListItemBody({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myListProvider = Provider.of<MyWatchingList>(context);
    List<MovieModel> myList = [];

    if(ListType.watchingList == title){
      myList = myListProvider.myWatchingListMovies.reversed.toList();
    }
    return Padding(
      padding: Constants.getTvPageTrackingOptionsBodyPadding,
      child: myList.isNotEmpty
        ? SizedBox(
          height: 150,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: myList.length,
          itemBuilder: (context,index){
            return Container(
              width: 100,
              margin: Constants.getTvPageTrackingOptionsBodyMargin,
              child: ClipRRect(
                borderRadius: Constants.getTvPageTrackingOptionsBodyBorderRadius,
                child: Image.asset(
                  myList.elementAt(index).imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },),
        )
        : const SizedBox(height: 150,child: MyListEmptyContent(message: "İçerik Eklenmemiş.")),
    );
  }
}

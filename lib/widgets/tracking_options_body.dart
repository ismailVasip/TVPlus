import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/data_helper.dart';
import 'package:tv_plus/pages/movie_details.dart';
import 'package:tv_plus/widgets/tracking_options_image_ph.dart';

class TrackingOptionsBody extends StatelessWidget {
  final int uniqueKey;
  final bool isTvPage;
  const TrackingOptionsBody({super.key,required this.uniqueKey,required this.isTvPage});

  get list => !isTvPage ? DataHelper.filteredList(uniqueKey)
                             : DataHelper.filteredListTv(uniqueKey);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context,index) {
          return Padding(
            padding:Constants.getTrackingOptionsBodyPadding,
            child: GestureDetector(
              onTap: (){
                if(!isTvPage){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MovieDetails(movie: list[index],))
                  );
                }
              },
              child: TrackingOptionsImagePh(model: list[index])
            ),
          );
        },
      ),
    );
  }
  
}

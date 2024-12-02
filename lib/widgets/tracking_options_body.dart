import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/data_helper.dart';
import 'package:tv_plus/models/movie_model.dart';
import 'package:tv_plus/widgets/tracking_options_image_ph.dart';

class TrackingOptionsBody extends StatelessWidget {
  final int uniqueKey;
  const TrackingOptionsBody({super.key,required this.uniqueKey});

  List<MovieModel>  get _movies => DataHelper.filteredList(uniqueKey);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _movies.length,
        itemBuilder: (context,index) {
          return Padding(
            padding:Constants.getTrackingOptionsBodyPadding,
            child: TrackingOptionsImagePh(movieModel: _movies[index]),
          );
        },
      ),
    );
  }
  
}

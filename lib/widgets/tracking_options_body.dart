import 'package:flutter/material.dart';
import 'package:tv_plus/data/data_helper.dart';
import 'package:tv_plus/models/movie_model.dart';
import 'package:tv_plus/widgets/tracking_options_image_ph.dart';

class TrackingOptionsBody extends StatelessWidget {
  TrackingOptionsBody({super.key});

  final List<MovieModel> _movies = DataHelper.movie_list;
  List<Widget> get  _imagePages => List.generate(
      _movies.length,
          (index) => TrackingOptionsImagePh(movieModel: _movies[index])
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imagePages.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _imagePages[index],
          );
        },
      ),
    );
  }
}

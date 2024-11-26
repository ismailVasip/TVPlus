import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/data_helper.dart';
import 'package:tv_plus/models/movie_model.dart';
import 'package:tv_plus/pages/categories_page.dart';
import 'package:tv_plus/widgets/image_place_holder.dart';
import 'package:tv_plus/widgets/sfm_page_category_fiter.dart';
import 'package:tv_plus/widgets/sfm_page_filter.dart';
import 'package:tv_plus/widgets/tracking_options.dart';
import 'package:tv_plus/widgets/tracking_options_header.dart';

class SpecialForMePage extends StatefulWidget {
  const SpecialForMePage({super.key});

  @override
  State<SpecialForMePage> createState() => _SpecialForMePageState();
}

class _SpecialForMePageState extends State<SpecialForMePage> {
  bool _is_filter_active = false;
  final List<MovieModel> _movies = DataHelper.movie_list;
  List<Widget> get  _imagePages => List.generate(
      _movies.length-12,
          (index) => ImagePlaceHolder(movieModel: _movies[index],length : _movies.length-12)
  );
  final int _active = 0;

  @override
  Widget build(BuildContext context) {
    return !_is_filter_active
      ?_buildUnfilteredPage()
      : _buildFilteredPage();
  }
  Widget _buildUnfilteredPage(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    child: const FilterWidget(label: "Dizi")
                ),
                GestureDetector(
                    child: const FilterWidget(label: "Film")
                ),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        _is_filter_active = true;
                      });
                    },
                    child:const FilterCategory(label: "Kategoriler")
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*5/9,
              width: double.infinity,
              child: PageView.builder(
                itemCount: _movies.length,
                itemBuilder: (context,index) {
                  return _imagePages[index];
                },
              ),
            ),
          ),
          const TrackingOptions(header: "Yeni Gelenler",),
          const TrackingOptions(header: "En Çok İzlenen Filmler",),
          const TrackingOptions(header: "Çok Yakında",),
          const TrackingOptions(header: "Senin İçin Seçtiklerimiz",),
          const TrackingOptions(header: "İzledin İzledin",),
          const TrackingOptions(header: "Keşfedebileceklerin",),
          const TrackingOptions(header: "Bunları Kaçırmamalısın",),

        ],
      ),
    );
  }
  Widget _buildFilteredPage(){
    return const CategoriesPage();
  }
}

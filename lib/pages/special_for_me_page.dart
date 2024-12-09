import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/data_helper.dart';
import 'package:tv_plus/models/movie_model.dart';
import 'package:tv_plus/pages/movie_details.dart';
import 'package:tv_plus/widgets/image_place_holder.dart';
import 'package:tv_plus/widgets/page_view_indicator.dart';
import 'package:tv_plus/widgets/tracking_options.dart';

class SpecialForMePage extends StatefulWidget {
  const SpecialForMePage({super.key});

  @override
  State<SpecialForMePage> createState() => _SpecialForMePageState();
}

class _SpecialForMePageState extends State<SpecialForMePage>
                                      with TickerProviderStateMixin{

  late ScrollController _scrollController;
  bool isCollapsed = false;
  int pageViewIndex = 0;

  final List<MovieModel> _movies = DataHelper.movieList;

  List<Widget> get _imagePages => List.generate(
    8,
        (index) => ImagePlaceHolder(
        movieModel: _movies[index],
    ),
  );

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final maxScrollOffset = MediaQuery.of(context).size.height * 0.55;
      final offset = _scrollController.offset;

      final normalizedValue = (offset / maxScrollOffset).clamp(0.0, 1.0);
      _animationController.value = normalizedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Constants.getScaffoldBackgroundColor,
        centerTitle: true,
        leadingWidth: 80,
        leading: Image.asset(
          "assets/images/tv_plus_logo.png",
          height: 56,
          width: 56,
          fit: BoxFit.cover,
        ),
        title: ScaleTransition(
          scale: _scaleAnimation,
          child: Text(
            "Bana Özel",
            style: TextStyle(
              fontSize: 19,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          _buildAppBarActionsIcon(Icons.search),
          const SizedBox(width: 8,),
          _buildAppBarActionsIcon(Icons.person_3_rounded),
          const SizedBox(width: 8,),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Constants.getScaffoldBackgroundColor,
            height: 35,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: _buildFilteringSection("Dizi",14),
                ),
                const SizedBox(width: 8,),
                GestureDetector(
                  child: _buildFilteringSection("Film",13),
                ),
                const SizedBox(width: 8,),
                GestureDetector(
                  child: _buildCategorySection(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4,),
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Constants.getScaffoldBackgroundColor,
                  expandedHeight: screenHeight * 0.55,
                  toolbarHeight: 0,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: PageController(
                              initialPage: _imagePages.length * 1000,
                              viewportFraction: 0.90
                          ),
                          onPageChanged: (index){
                            setState(() {
                              pageViewIndex = index % _imagePages.length;
                            });
                          },
                          itemBuilder: (context, index) {
                            final actualIndex = index % _imagePages.length;
                            return GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => MovieDetails(movie: _movies[actualIndex]))
                                );
                              },
                              child: Padding(
                                padding: Constants.getPageViewPadding,
                                child: _imagePages[actualIndex],
                              ),
                            );
                          },
                        ),
                      ),
                      PageViewIndicator(currentIndex: pageViewIndex)
                    ],
                  ),
                                      ),
                ),
                const SliverToBoxAdapter(
                  child:  SizedBox(
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: screenHeight,
                    ),
                    child: const Material(
                        color: Constants.getScaffoldBackgroundColor,
                        elevation: 7,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TrackingOptions(header: "Yeni Gelenler",uniqueKey: 1,isTvPage: false),
                            TrackingOptions(header: "En Çok İzlenen Filmler",uniqueKey: 2,isTvPage: false),
                            TrackingOptions(header: "Çok Yakında",uniqueKey: 3,isTvPage: false),
                            TrackingOptions(header: "Senin İçin Seçtiklerimiz",uniqueKey: 4,isTvPage: false),
                            TrackingOptions(header: "İzledin İzledin",uniqueKey: 5,isTvPage: false),
                            TrackingOptions(header: "Keşfedebileceklerin",uniqueKey: 6,isTvPage: false),
                            TrackingOptions(header: "Bunları Kaçırmamalısın",uniqueKey: 7,isTvPage: false),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      )
    );
  }
  Widget _buildAppBarActionsIcon(IconData icon) {
    return Icon(
      icon,
      size: 36,
      color: Colors.white,
    );
  }
  Widget _buildFilteringSection(String title,double fontSize){
    return Container(
      height: 35,
      width: 80,
      decoration: BoxDecoration(
          color: Constants.getScaffoldBackgroundColor,
          border: Border.all(color: Colors.white70,width: 1),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.white
          ),
        ),
      ),
    );
  }
  Widget _buildCategorySection(){
    return Container(
      height: 35,
      width: 145,
      decoration: BoxDecoration(
          color: Constants.getScaffoldBackgroundColor,
          border: Border.all(color: Colors.white70,width:1),
          borderRadius: BorderRadius.circular(4)
      ),
      child: const Center(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kategoriler",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
              ),
            ),
            SizedBox(width: 2,),
            Icon(
              Icons.keyboard_arrow_down,
              size: 19,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
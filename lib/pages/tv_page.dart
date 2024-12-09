import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/data_helper.dart';
import 'package:tv_plus/models/tv_model.dart';
import 'package:tv_plus/widgets/page_view_indicator.dart';
import 'package:tv_plus/widgets/tracking_options.dart';
import 'package:tv_plus/widgets/tv_pageview_item_builder.dart';

class TvPage extends StatefulWidget {
  const TvPage({super.key});

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> with TickerProviderStateMixin{
  late ScrollController _scrollController;
  bool isCollapsed = false;
  int pageViewIndex = 0;

  final List<TvModel> channels = DataHelper.tvList.where((x)=> x.category == "Kanal").toList();

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  List<Widget> get  pageViewItems => List.generate(
      channels.length,
      (index) => TvPageviewItemBuilder(
        tvModel :channels[index]
      )
      );

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

    return SafeArea(
      child: Scaffold(
        appBar : AppBar(
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
            child: const Text(
              "TV",
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
        body: CustomScrollView(
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
                            initialPage: pageViewItems.length * 1000,
                            viewportFraction: 0.90
                        ),
                        onPageChanged: (index){
                          setState(() {
                            pageViewIndex = index % pageViewItems.length;
                          });
                        },
                        itemBuilder: (context,index){
                          final actualIndex = index % pageViewItems.length;
                          return Padding(
                            padding: Constants.getPageViewPadding,
                            child: pageViewItems[actualIndex],
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
                        TrackingOptions(header: "TV Rehberi",uniqueKey: 8,isTvPage: true,),
                        TrackingOptions(header: "Canlı Yayınlar",uniqueKey: 9,isTvPage: true),
                        TrackingOptions(header: "Son İzlediğim Kanallar",uniqueKey: 10,isTvPage: true),
                        TrackingOptions(header: "Dizi",uniqueKey: 11,isTvPage: true),
                        TrackingOptions(header: "Spor",uniqueKey: 12,isTvPage: true),
                        TrackingOptions(header: "Belgesel",uniqueKey: 13,isTvPage: true),
                        TrackingOptions(header: "Eğlence ve Yaşam",uniqueKey: 14,isTvPage: true),
                        TrackingOptions(header: "Tarih",uniqueKey: 15,isTvPage: true),

                      ],
                    )
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildAppBarActionsIcon(IconData icon) {
    return Icon(
      icon,
      size: 36,
      color: Colors.white,
    );
  }
}

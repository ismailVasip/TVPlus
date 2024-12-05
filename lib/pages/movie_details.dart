import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/data_helper.dart';
import 'package:tv_plus/data/my_downloaded.dart';
import 'package:tv_plus/models/movie_model.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movie;
  const MovieDetails({
    required this.movie,
    super.key
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late ScrollController _scrollController;
  bool isCollapsed = false;
  final collapsedHeight = kToolbarHeight;
  double expandedHeight = 0;

  final List<MovieModel> _movies = DataHelper.movieList;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener() {
    final offset = _scrollController.offset;
    if (offset >= expandedHeight - collapsedHeight && !isCollapsed) {
      setState(() {
        isCollapsed = true; // Çökmüş durumda
      });
    } else if (offset < expandedHeight - collapsedHeight && isCollapsed) {
      setState(() {
        isCollapsed = false; // Tamamen genişlemiş durumda
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //MovieModel movie = DataHelper.movieList.elementAt(widget.movieId);
    expandedHeight = MediaQuery.of(context).size.height*0.55;

    final myDownloadedMovies = Provider.of<MyDownloadedMovies>(context);

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
              return[
                SliverAppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  actions:const [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(width: 16,),
                  ],
                  collapsedHeight: kToolbarHeight*1.2,
                  expandedHeight: expandedHeight,
                  backgroundColor: Constants.getScaffoldBackgroundColor,
                  pinned: true,
                  title: isCollapsed
                      ? Text(
                    widget.movie.movieName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  )
                      : const Text(""),
                  titleSpacing: 60,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: Constants.getPageViewImageBorderRadius,
                          child: Image.asset(
                            widget.movie.imagePath,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Constants.getScaffoldBackgroundColor.withOpacity(0.3),
                                  Constants.getScaffoldBackgroundColor.withOpacity(1),
                                  //Colors.transparent
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: Constants.getMovieDetailsSliverAppBarMargin,
                            height: 50,
                            width: double.infinity,
                            decoration:const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: Constants.getMovieDetailsButtonRadius,
                            ),
                            child: const Center(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow_rounded,
                                    size: 27,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Hemen İzle",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 86,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: Constants.getMovieDetailsSliverAppBarMargin,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text(
                                  widget.movie.movieType,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 19
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                _buildCircle(),
                                const SizedBox(width: 8,),
                                _buildDetailText("2021"),
                                const SizedBox(width: 8,),
                                _buildCircle(),
                                const SizedBox(width: 8,),
                                _buildDetailText("120 dk"),
                                const SizedBox(width: 16,),
                                Container(
                                  padding: Constants.getMovieDetailsAgeWarningPadding,
                                  decoration:const  BoxDecoration(
                                    color: Constants.getScaffoldBackgroundColor,
                                  ),
                                  child: const Text(
                                    "13+",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 130,
                          child: Container(
                            margin: Constants.getMovieDetailsSliverAppBarMargin,
                            child: Text(
                              widget.movie.movieName.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 4,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: Constants.getMovieDetailsBodyMargin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildQuickAction(Icons.add,"Listeye Ekle"),
                            _buildQuickAction(Icons.thumb_up_alt_outlined,"Puan Ver"),
                            GestureDetector(
                              onTap: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "İndirildi!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19
                                      ),
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                myDownloadedMovies.addMovie(widget.movie);
                              },
                              child: _buildQuickAction(Icons.download_sharp,"İndir"),
                            ),
                            _buildQuickAction(Icons.video_collection_outlined,"Fragman"),
                          ],
                        ),
                      ),
                      Container(
                        margin: Constants.getMovieDetailsBodyMargin,
                        child: Text(
                          widget.movie.movieName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21
                          ),
                        ),
                      ),
                      Container(
                        margin: Constants.getMovieDetailsBodyMargin,
                        child: RichText(
                          //textAlign: TextAlign.center,
                          text: const TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                              children: [
                                TextSpan(text: "Orta Amerika'nın tam kalbinde,içeri giren\n"),
                                TextSpan(text: "herkesi adet esir alan gizemli bir şehir"),
                                TextSpan(text: " yatıyor. Şehrin sakinl...\n"),
                                TextSpan(
                                    text: "daha fazla bilgi",
                                    style: TextStyle(
                                        color: Colors.white30,
                                        fontSize: 17,
                                        height: 1.5,
                                        decoration: TextDecoration.underline
                                    )
                                )
                              ]
                          ),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        margin: Constants.getMovieDetailsBodyMargin,
                        child: Text(
                          widget.movie.toString(),
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                    ],
                  ),
                )
              ];
            },
          body: widget.movie.movieType == "Dizi"
              ? _buildTabBarAndViews(3,widget.movie)
              : _buildTabBarAndViews(2,widget.movie),
        )
      )
    );
  }
  _buildCircle(){
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Colors.white54,
        borderRadius: Constants.getPageViewIndicatorBorderRadius,

      ),
    );
  }
  _buildDetailText(String data){
    return Text(
      data,
      style: const TextStyle(
          color: Colors.white70,
          fontSize: 17
      ),
    );
  }
  _buildQuickAction(IconData icon,String label){
    return Padding(
      padding: Constants.getMovieDetailsQuickActionPadding,
      child: Column(
        children: [
          _buildQuickActionIcon(icon),
          _buildQuickActionText(label),
        ],
      ),
    );
  }
  _buildQuickActionIcon(IconData icon){
    return Icon(
      icon,
      size: 30,
      color: Colors.white54,
    );
  }
  _buildQuickActionText(String label){
    return Text(
      label,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.white24
      ),
    );
  }
  _buildTabBarAndViews(int length,MovieModel movie){
    return DefaultTabController(
      length: length,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable : true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white38,
                indicatorSize: TabBarIndicatorSize.label,
                dividerHeight: 0,
                indicator: MaterialIndicator(
                  tabPosition: TabPosition.top,
                  color: Colors.yellow,
                  height: 2,
                ),
                tabs: [
                  if(length == 3)
                    Tab(
                      text: "Bölümler",
                    ),
                  Tab(
                    text: "Benzerleri",
                  ),
                  Tab(
                    text: "Ekstralar",
                  )
                ],
              ),
              const Divider(
                height: 2,
                color: Colors.white12,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                if(length == 3)
                  ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: Constants.getMovieDetailsBodyMargin,
                            width: 150,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.white12,
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sezon 1",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white70
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 24,
                                  color: Colors.white70,
                                )
                              ],
                            )
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        margin: Constants.getMovieDetailsBodyMargin,
                        child: ListView.builder(
                          itemCount: 8,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: SizedBox(
                                        height: 100,
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              movie.imagePath,
                                              fit: BoxFit.cover,
                                            ),
                                            const Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Icon(
                                                Icons.play_circle,
                                                size: 50,
                                                color: Colors.orange,
                                              ),
                                            )
                                          ],
                                        )
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    Flexible(
                                      flex:2,
                                      child: SizedBox(
                                        height: 100,
                                        child : Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              overflow: TextOverflow.fade,
                                              "${index + 1}  ${movie.movieName}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 21
                                              ),
                                            ),
                                            Text(
                                              overflow: TextOverflow.fade,
                                              "${(index + 1) * 20} dk",
                                              style: const TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 17
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    Flexible(
                                      flex : 1,
                                      child: SizedBox(
                                        height: 100,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.download,
                                            color: Colors.white54,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                                  child:  Text(
                                    overflow: TextOverflow.fade,
                                    "Contrary to popular belief, Lorem Ipsum is not simply random text.",
                                    style:  TextStyle(
                                      color: Colors.white70,
                                      fontSize: 17
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _movies.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: Constants.getMovieDetailsSimilarTabPadding,
                      child: ClipRRect(
                        borderRadius: Constants.getMovieDetailsSimilarTabBorderRadius,
                        child: Image.asset(
                          _movies[index].imagePath,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 100,
                        ),
                      ),
                    );
                  },
                ),
                const Center(
                  child: Text(
                    "Ekstralar İçeriği",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/data/my_downloaded.dart';
import 'package:tv_plus/widgets/classic_appbar.dart';
import 'package:tv_plus/widgets/my_downloads_empty_content.dart';

class MyDownloads extends StatefulWidget {

  @override
  State<MyDownloads> createState() => _MyDownloadsState();
}

class _MyDownloadsState extends State<MyDownloads> {

  @override
  Widget build(BuildContext context) {
    final myDownloadedMovies = Provider.of<MyDownloadedMovies>(context);
    final myDownloadedMoviesList =  myDownloadedMovies.myDownloadedMovies;

    return Scaffold(
      appBar:const ClassicAppbar(title: "İNDİRDİKLERİM"),
      body: myDownloadedMoviesList.isNotEmpty
        ? CustomScrollView(
        slivers: [
          SlidableAutoCloseBehavior(
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: myDownloadedMoviesList.length,
                  (context,index){
                    return Slidable(
                      key: ValueKey(index),
                      closeOnScroll: true,
                      groupTag: "myDownloads",
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context){
                              myDownloadedMovies.deleteMovie(myDownloadedMoviesList.elementAt(index));
                            },
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.delete_outline_rounded,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          myDownloadedMoviesList[index].imagePath,
                          width: 100,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          myDownloadedMoviesList[index].movieName,
                          style: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                        subtitle: const Row(
                          children: [
                            Text("120 dk",style: TextStyle(color: Colors.white30,fontSize: 14),),
                            Text(" | ",style: TextStyle(color: Colors.white30,fontSize: 14),),
                            Text("650 MB",style: TextStyle(color: Colors.white30,fontSize: 14),)
                          ],
                        ),
                        trailing: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.amber,
                          size: 30,
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              child: Container(
                margin: Constants.getMyDownloadDiscoverNewContentMargin,
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: Constants.getScaffoldBackgroundColor,
                  borderRadius: Constants.getMyDownloadDiscoverNewContentBorderRadius,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Text(
                  "İndirebileceğin İçerikleri Keşfet",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )
        : const MyDownloadsEmptyContent()
    );
  }
}

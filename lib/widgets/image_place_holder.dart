import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/models/movie_model.dart';

class ImagePlaceHolder extends StatelessWidget {
  final MovieModel movieModel;
  final int length;
  const ImagePlaceHolder(
      {
        super.key,required this.movieModel,
        required this.length
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){},
          child: ClipRRect(
            borderRadius: Constants.getPageViewImageBorderRadius,
            child: Image.asset(
              movieModel.imagePath,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent, // Üst kısım tamamen şeffaf
                  Constants.getScaffoldBackgroundColor.withOpacity(1),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movieModel.movieName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text(
                movieModel.toString(),
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white60
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // İç padding kaldırılıyor
                  minimumSize: Size(0, 0), // Varsayılan minimum boyut kaldırılıyor
                ),
                onPressed: (){},
                child: Container(
                  alignment: Alignment.center,
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      color : Colors.yellow,
                      borderRadius: BorderRadius.circular(7.0)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 19,
                      ),
                      SizedBox(width: 4,),
                      Text(
                        "Hemen İzle",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color : Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // İç padding tamamen kaldırılıyor
                  minimumSize: Size(0, 0), // Varsayılan minimum boyut kaldırılıyor
                ),
                onPressed: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                      color : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(7.0)
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

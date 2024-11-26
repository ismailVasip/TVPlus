import 'package:flutter/material.dart';
import 'package:tv_plus/models/movie_model.dart';

class ImagePlaceHolder extends StatelessWidget {
  final MovieModel movieModel;
  final int length;
  final int _active = 0;
  const ImagePlaceHolder({super.key,required this.movieModel,required this.length});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Image.asset(
            movieModel.image_path,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movieModel.movie_name,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text(
                movieModel.toString(),
                style: const TextStyle(
                  fontSize: 21,
                  color: Colors.white60
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color : Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                    length,
                    (index) => Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: _active == index
                          ? Colors.white
                          : Colors.grey,
                    ),
                  )
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                    color : Colors.amber,
                    borderRadius: BorderRadius.circular(7.0)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 23,
                      ),
                      Text(
                        "Hemen İzle",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color : Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              TextButton(
                onPressed: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(7.0)
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 41,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

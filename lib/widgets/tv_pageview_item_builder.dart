import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';
import 'package:tv_plus/models/tv_model.dart';

class TvPageviewItemBuilder extends StatelessWidget {
  final TvModel tvModel;
  const TvPageviewItemBuilder({required this.tvModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: Constants.getPageViewImageBorderRadius,
          child: Image.asset(
            tvModel.imagePath,
            fit: BoxFit.contain,
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
          bottom: 30,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero, // İç padding kaldırılıyor
              minimumSize:const Size(0, 0), // Varsayılan minimum boyut kaldırılıyor
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
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tvModel.name,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text(
                tvModel.category,
                style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white60
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

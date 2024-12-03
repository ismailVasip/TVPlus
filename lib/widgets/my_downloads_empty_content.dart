import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class MyDownloadsEmptyContent extends StatelessWidget {
  const MyDownloadsEmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              borderRadius: Constants.getMyDownloadsEmptyContentIconBRadius,
              color: Colors.amberAccent,
            ),
            child: const Icon(
              Icons.download,
              color: Colors.black,
              size: 35,
            ),
          ),
          const SizedBox(height: 8,),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    height: 1.3
                ),
                children: [
                  TextSpan(text: "Henüz hiçbir içeriği çevrim dışına\n"),
                  TextSpan(text: "almamışsın. Çevrim dışıyken de\n"),
                  TextSpan(text: "izleme keyfine devam edebilmek\n"),
                  TextSpan(text: "için indirebileceğin içerikleri\n"),
                  TextSpan(text: "görmek ister misin?\n"),
                ]
            ),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 240,
              height: 60,
              decoration: BoxDecoration(
                  color: Constants.getScaffoldBackgroundColor,
                  borderRadius: Constants.getMyDownloadsEmptyContentButtonBRadius,
                  border: Border.all(
                      color: Colors.white,
                      width: 3,
                      style: BorderStyle.solid
                  )
              ),
              child: const Text(
                "Keşfet",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

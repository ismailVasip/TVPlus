import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class PageViewIndicator extends StatelessWidget {
  final int currentIndex;
  const PageViewIndicator({super.key,required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            8,
            (index) => Padding(
            padding:  Constants.getPageViewIndicatorPadding,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.transparent,
                  borderRadius: Constants.getPageViewIndicatorBorderRadius,
                  border: Border.all(
                    color: Colors.white24,
                    width: 1,
                    style: BorderStyle.solid
                  )
                ),
              )
            )
        ),
      ),
    );
  }
}

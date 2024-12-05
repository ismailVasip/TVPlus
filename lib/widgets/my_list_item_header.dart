import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class MyListItemHeader extends StatelessWidget {
  final String title;
  final bool isArrowForwardActive;
  const MyListItemHeader({
    super.key,
    required this.title,
    required this.isArrowForwardActive
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Constants.getTvPageTrackingOptionsHeaderMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23
              ),
            ),
          ),
          const SizedBox(width: 16,),
          isArrowForwardActive
            ? const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 27,
            color: Colors.white,
            )
            : const SizedBox()
        ],
      ),
    );
  }
}

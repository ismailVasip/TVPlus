import 'package:flutter/material.dart';
import 'package:tv_plus/constants/constants.dart';

class TrackingOptionsHeader extends StatelessWidget {
  final String header;
  const TrackingOptionsHeader({super.key,required this.header});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.getTrackingOptionsHeaderPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(width: 16,),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

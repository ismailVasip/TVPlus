import 'package:flutter/material.dart';

class TrackingOptionsHeader extends StatelessWidget {
  final String header;
  const TrackingOptionsHeader({super.key,required this.header});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(width: 15,),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 24,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

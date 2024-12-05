import 'package:flutter/material.dart';

class MyListEmptyContent extends StatelessWidget {
  final String message;
  const MyListEmptyContent({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 50,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: const TextStyle(
                color: Colors.white54,
                fontSize: 19,
                height: 1.3
            ),
            children: [
              TextSpan(text: message),
            ]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TvPage extends StatelessWidget {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.orange,
          height: MediaQuery.of(context).size.height * 5/7,
          child: Placeholder(),
        ),
      ),
    );
  }
}

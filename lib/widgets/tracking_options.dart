import 'package:flutter/material.dart';
import 'package:tv_plus/widgets/tracking_options_body.dart';
import 'package:tv_plus/widgets/tracking_options_header.dart';

class TrackingOptions extends StatelessWidget {
  final String header;
  const TrackingOptions({super.key,required this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrackingOptionsHeader(header: header),
        const SizedBox(height: 8),
        TrackingOptionsBody()
      ],
    );
  }
}

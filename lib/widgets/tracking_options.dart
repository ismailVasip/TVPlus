import 'package:flutter/material.dart';
import 'package:tv_plus/widgets/tracking_options_body.dart';
import 'package:tv_plus/widgets/tracking_options_header.dart';

class TrackingOptions extends StatelessWidget {
  final String header;
  final int uniqueKey;
  final bool isTvPage;
  const TrackingOptions({
    super.key,
    required this.header,
    required this.uniqueKey,
    required this.isTvPage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrackingOptionsHeader(header: header),
        TrackingOptionsBody(uniqueKey: uniqueKey,isTvPage:isTvPage)
      ],
    );
  }
}

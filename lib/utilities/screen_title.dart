import 'package:flutter/material.dart';

class ScreenMainTitle extends StatelessWidget {
  const ScreenMainTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff2CA02E),
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ScreenSubtitle extends StatelessWidget {
  const ScreenSubtitle({Key? key, required this.subtitle}) : super(key: key);
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        color: Color(0xff323232),
      ),
    );
  }
}

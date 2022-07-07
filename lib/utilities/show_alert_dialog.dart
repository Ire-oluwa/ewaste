import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({
    Key? key,
    required this.icon,
    required this.mainTitle,
    required this.contentText,
    this.actions,
  }) : super(key: key);
  final Icon icon;
  final String mainTitle;
  final String contentText;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: icon,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              mainTitle,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              contentText,
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }
}

import 'package:flutter/material.dart';

class SubmissionButton extends StatelessWidget {
  const SubmissionButton(
      {Key? key, required this.title, required this.onClicked})
      : super(key: key);
  final String title;
  final void Function() onClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        fillColor: const Color(0xff2CA02E),
        onPressed: onClicked,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

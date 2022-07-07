import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    Key? key,
    required this.title,
    required this.textColour,
    this.backgroundColour,
    this.textStyle,
    required this.onClicked,
  }) : super(key: key);
  final String title;
  final Color textColour;
  final Color? backgroundColour;
  final double? textStyle;
  final void Function() onClicked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: TextButton(
          onPressed: onClicked,
          child: Text(
            title,
            style: TextStyle(
              color: textColour,
              fontSize: 15.0,
            ),
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Colors.white30,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(backgroundColour),
          ),
        ),
      ),
    );
  }
}

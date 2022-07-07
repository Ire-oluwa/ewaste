import 'package:ewaste/screens/onboarding_screens/profile_screen_1.dart';
import 'package:flutter/material.dart';

class ExitActionRow extends StatelessWidget {
  const ExitActionRow(
      {Key? key, required this.trailingText, required this.trailingOnClicked})
      : super(key: key);
  final String trailingText;
  final void Function() trailingOnClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ProfileScreen1.id);
          },
          icon: const Icon(
            Icons.close,
            color: Color(0xff66AA28),
          ),
        ),
        TextButton(
          onPressed: trailingOnClicked,
          child: Text(
            trailingText,
            style: const TextStyle(
              color: Color(0xff66AA28),
            ),
          ),
        ),
      ],
    );
  }
}

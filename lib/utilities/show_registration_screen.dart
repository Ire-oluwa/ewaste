import 'package:ewaste/screens/authentication_screens/registration_screen.dart';
import 'package:flutter/material.dart';

Future<dynamic> showRegistrationScreen(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const RegistrationScreen(),
      ),
    ),
  );
}

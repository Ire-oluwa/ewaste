import 'package:ewaste/utilities/choice_button.dart';
import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/show_registration_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen3 extends StatelessWidget {
  const ProfileScreen3({Key? key}) : super(key: key);
  static const String id = 'Screen3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kGradientDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: kSkipPadding,
              child: TextButton(
                onPressed: () {
                  showRegistrationScreen(context);
                },
                child: kSkipText,
              ),
            ),
            const SizedBox(height: 50.0),
            Column(
              children: const [
                Padding(
                  padding: kImagePadding,
                  child: Image(
                    image: AssetImage(
                      'images/environment.png',
                    ),
                  ),
                ),
              ],
            ),
            kImageTextDivider,
            kTextColumn,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceButton(
                      title: 'Skip',
                      textColour: Colors.white,
                      onClicked: () {
                        showRegistrationScreen(context);
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ChoiceButton(
                      title: 'Next',
                      textColour: Colors.black87,
                      backgroundColour: Colors.white,
                      onClicked: () {
                        showRegistrationScreen(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

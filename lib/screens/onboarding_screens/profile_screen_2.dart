import 'package:ewaste/screens/onboarding_screens/profile_screen_3.dart';
import 'package:ewaste/utilities/choice_button.dart';
import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/show_registration_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({Key? key}) : super(key: key);
  static const String id = 'Screen2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kGradientDecoration,
        child: Column(
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
            const SizedBox(height: 45.0),
            Column(
              children: const [
                Padding(
                  padding: kImagePadding,
                  child: Image(
                    image: AssetImage(
                      'images/environmental-audit.png',
                    ),
                  ),
                ),
              ],
            ),
            kImageTextDivider,
            Center(
              child: Column(
                children: const [
                  kMainTitle,
                  Text(
                    'Let\'s make OYO a great eco-friendly\n environment',
                    textAlign: TextAlign.center,
                    style: kSubHeadingStyle,
                  ),
                ],
              ),
            ),
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
                        Navigator.pushNamed(context, ProfileScreen3.id);
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

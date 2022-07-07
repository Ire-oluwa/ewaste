import 'package:ewaste/screens/onboarding_screens/profile_screen_2.dart';
import 'package:ewaste/utilities/choice_button.dart';
import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/show_registration_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen1 extends StatelessWidget {
  const ProfileScreen1({Key? key}) : super(key: key);
  static const String id = 'Screen1';

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
            const SizedBox(height: 50.0),
            Column(
              children: const [
                Padding(
                  padding: kImagePadding,
                  child: Image(
                    image: AssetImage(
                      'images/smart-home.png',
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
                          Navigator.pushNamed(context, ProfileScreen2.id);
                        })
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

import 'package:ewaste/screens/authentication_screens/reset_password_screen.dart';
import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/exit_action.dart';
import 'package:ewaste/utilities/input_text.dart';
import 'package:ewaste/utilities/screen_title.dart';
import 'package:ewaste/utilities/submission_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String id = 'ForgotPasswordScreen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late bool _validate = false;
  late String email;
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: kModalSheetContainerPadding,
        decoration: kGradientDecoration,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            decoration: kModalSheetRoundedContainer,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ExitActionRow(
                      trailingText: 'Back',
                      trailingOnClicked: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: ScreenMainTitle(title: 'Forgot Password?'),
                    ),
                    const ScreenSubtitle(
                      subtitle:
                          'Don\'t worry it happened. Please enter your full house phone number or email associated with your House ID.',
                    ),
                    const SizedBox(height: 40.0),
                    InputTextField(
                      labelText: 'Email Address',
                      keyboard: TextInputType.emailAddress,
                      hideText: false,
                      errorWarning:
                          _validate ? 'Fill in your email address' : null,
                      controller: emailController,
                      formatInput: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9_@.]'),
                        ),
                      ],
                      onChanged: (value) {
                        email = emailController.text;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 220.0, bottom: 15.0),
                      child: SubmissionButton(
                        title: 'Submit',
                        onClicked: () {
                          setState(() {});
                          if (emailController.text.isEmpty) {
                            _validate = true;
                          } else {
                            _validate = false;
                            Navigator.pushNamed(context, ResetPassword.id);
                          }
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Oops, I remember my details',
                        style: TextStyle(
                          color: Color(0xff2CA02E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

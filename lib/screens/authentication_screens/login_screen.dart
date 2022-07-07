import 'package:ewaste/screens/authentication_screens/forgot_password_screen.dart';
import 'package:ewaste/screens/onboarding_screens/profile_screen_1.dart';
import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/input_text.dart';
import 'package:ewaste/utilities/screen_title.dart';
import 'package:ewaste/utilities/show_registration_screen.dart';
import 'package:ewaste/utilities/submission_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);
  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  late String phoneNumber;
  late String password;

  @override
  void dispose() {
    numberController.dispose();
    passwordController.dispose();
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
                    vertical: 20.0, horizontal: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      alignment: Alignment.topLeft,
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xff66AA28),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, ProfileScreen1.id);
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                      child: ScreenMainTitle(
                        title: 'Welcome Back',
                      ),
                    ),
                    const ScreenSubtitle(
                        subtitle:
                            'We\'re so happy. You can login to continue  using the \n e-waste app'),
                    const SizedBox(height: 40.0),
                    InputTextField(
                      labelText: 'Phone Number',
                      keyboard: TextInputType.phone,
                      hideText: false,
                      controller: numberController,
                      formatInput: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9 ().,-]'),
                        ),
                      ],
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 270.0,
                          child: InputTextField(
                            labelText: 'Password',
                            hideText: true,
                            controller: passwordController,
                            formatInput: [
                              FilteringTextInputFormatter.deny(
                                RegExp(r'[/\\|_,]'),
                              ),
                            ],
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        kFingerPrint,
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgotPasswordScreen.id);
                      },
                      child: const Text(
                        'Forgot Password?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xff2CA02E),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0, bottom: 15.0),
                      child: SubmissionButton(
                        title: 'Sign in',
                        onClicked: () {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New to e-waste?',
                          style: TextStyle(
                            color: Color(0xff161616),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showRegistrationScreen(context);
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Color(0xff2CA02E),
                            ),
                          ),
                        ),
                      ],
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

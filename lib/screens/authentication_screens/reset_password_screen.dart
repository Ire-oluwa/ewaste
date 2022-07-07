import 'package:ewaste/screens/authentication_screens/login_screen.dart';
import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/exit_action.dart';
import 'package:ewaste/utilities/input_text.dart';
import 'package:ewaste/utilities/screen_title.dart';
import 'package:ewaste/utilities/show_alert_dialog.dart';
import 'package:ewaste/utilities/submission_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  static const String id = 'ResetPassword';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late String newPassword = '';
  late String confirmPassword = '';
  late bool _validate = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
                      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                      child: ScreenMainTitle(title: 'Reset Password'),
                    ),
                    const ScreenSubtitle(
                      subtitle:
                          'Password must contain at least 7 letters and 1 number',
                    ),
                    const SizedBox(height: 40.0),
                    InputTextField(
                      labelText: 'New Password',
                      hideText: true,
                      errorWarning: _validate
                          ? 'This field can\'t be empty or less than 8 characters'
                          : null,
                      controller: newPasswordController,
                      onChanged: (value) {
                        setState(() {
                          newPassword = newPasswordController.text;
                        });
                      },
                      formatInput: [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'[/\\|_,]'),
                        ),
                      ],
                    ),
                    InputTextField(
                      labelText: 'Confirm Password',
                      hideText: true,
                      errorWarning: _validate
                          ? 'this input isn\'t the same as above or isn\'t 8 characters'
                          : null,
                      controller: confirmPasswordController,
                      formatInput: [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'[/\\|_,]'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          confirmPassword = confirmPasswordController.text;
                        });
                      },
                    ),
                    const SizedBox(height: 150.0),
                    SubmissionButton(
                      title: 'Reset Password',
                      onClicked: () {
                        setState(() {
                          if (newPassword != confirmPassword) {
                            _validate = true;
                          } else if (newPasswordController.text.isEmpty ||
                              confirmPasswordController.text.isEmpty) {
                            _validate = true;
                          } else if (newPasswordController.text.length < 8 ||
                              confirmPasswordController.text.length < 8) {
                            _validate = true;
                          } else {
                            _validate = false;
                            newPassword = newPasswordController.text;
                            confirmPassword = newPassword;

                            _showDialog(context);
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 30.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: const Text(
                        'Oops, I remember my details',
                        textAlign: TextAlign.center,
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

_showDialog(context) {
  return showDialog(
    context: context,
    builder: (context) => Alert(
      icon: const Icon(
        Icons.check_circle_outline,
        size: 72.0,
        color: Color(0xff66AA28),
      ),
      mainTitle: 'Password reset',
      contentText:
          'Your password has been reset successfully, kindly continue to login to your account.',
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SubmissionButton(
              title: 'Ok',
              onClicked: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ],
    ),
  );
}

import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/exit_action.dart';
import 'package:ewaste/utilities/otp_input.dart';
import 'package:ewaste/utilities/screen_title.dart';
import 'package:ewaste/utilities/submission_button.dart';
import 'package:flutter/material.dart';

class OtpConfirmation extends StatefulWidget {
  const OtpConfirmation({Key? key, required this.number}) : super(key: key);
  static const String id = 'OtpConfirmation';
  final String number;

  @override
  State<OtpConfirmation> createState() => _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation> {
  final _firstController = TextEditingController();

  final _secondController = TextEditingController();

  final _thirdController = TextEditingController();

  final _fourthController = TextEditingController();

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
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
                  vertical: 20.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ExitActionRow(
                      trailingText: 'Edit Number',
                      trailingOnClicked: () {
                        Navigator.pop(context);
                      },
                    ),
                    const ScreenMainTitle(
                      title: 'Confirm your OTP',
                    ),
                    const SizedBox(height: 5.0),
                    RichText(
                      text: TextSpan(
                        text: 'A ',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: '4 digit code ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                              text: 'has been sent to your number\n'),
                          const TextSpan(
                            text: '+234 ',
                            style: TextStyle(
                              color: Color(0xff2CA02E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.number,
                            style: const TextStyle(
                              color: Color(0xff2CA02E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' and email address'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 15.0,
                        right: 15.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        children: [
                          OTPInput(
                            controller: _firstController,
                          ),
                          OTPInput(
                            controller: _secondController,
                          ),
                          OTPInput(
                            controller: _thirdController,
                          ),
                          OTPInput(
                            controller: _fourthController,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Didn\'t receive code?'),
                        TextButton(
                          onPressed: () {
                            _firstController.clear();
                            _secondController.clear();
                            _thirdController.clear();
                            _fourthController.clear();
                          },
                          child: const Text('Resend'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 220.0,
                    ),
                    SubmissionButton(
                      title: 'Verify account',
                      onClicked: () {},
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

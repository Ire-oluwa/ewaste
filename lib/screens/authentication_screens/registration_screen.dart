import 'package:ewaste/screens/authentication_screens/login_screen.dart';
import 'package:ewaste/screens/authentication_screens/otp_confirmation.dart';
import 'package:ewaste/utilities/constants.dart';
import 'package:ewaste/utilities/input_text.dart';
import 'package:ewaste/utilities/screen_title.dart';
import 'package:ewaste/utilities/submission_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const String id = 'Registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late bool _validate = false;

  final phoneNumberController = TextEditingController();
  final userNameController = TextEditingController();
  final houseIDController = TextEditingController();
  final passwordController = TextEditingController();
  late final String username;
  late final String phoneNumber;
  late final String houseAddress;
  late final String password;

  late bool _passwordObscured;

  @override
  void initState() {
    _passwordObscured = true;
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    phoneNumberController.dispose();
    houseIDController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF757575),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 32.0,
            right: 27.0,
            bottom: 40.0,
          ),
          decoration: kModalSheetRoundedContainer,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ScreenMainTitle(title: 'Create an account'),
                const ScreenSubtitle(
                    subtitle:
                        'Create an account so you can manage your house waste\npickups'),
                const SizedBox(
                  height: 30.0,
                ),
                InputTextField(
                  labelText: 'Name',
                  hideText: false,
                  errorWarning: _validate ? 'Your name is required' : null,
                  controller: userNameController,
                  onChanged: (value) {
                    setState(() {
                      username = userNameController.text;
                    });
                  },
                  formatInput: [
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z ]'),
                        allow: true)
                  ],
                ),
                InputTextField(
                  keyboard: TextInputType.phone,
                  labelText: 'Phone Number',
                  maximumLength: 10,
                  defaultText: '+234',
                  hideText: false,
                  errorWarning: _validate ? 'Phone Number is required' : null,
                  controller: phoneNumberController,
                  formatInput: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    setState(() {
                      //phoneNumber = value;
                      phoneNumber = phoneNumberController.text;
                    });
                  },
                ),
                InputTextField(
                  labelText: 'House ID',
                  keyboard: TextInputType.streetAddress,
                  hideText: false,
                  errorWarning: _validate ? 'House Address is required' : null,
                  controller: houseIDController,
                  onChanged: (value) {
                    setState(() {
                      houseAddress = houseIDController.text;
                    });
                  },
                  formatInput: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z0-9 ().,-]'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 270.0,
                      child: InputTextField(
                        labelText: 'Password',
                        hideText: !_passwordObscured,
                        helperText:
                            'must contain at least 7 letters and 1 number',
                        errorWarning: _validate ? 'Input your password' : null,
                        controller: passwordController,
                        onChanged: (value) {
                          setState(() {
                            password = passwordController.text;
                          });
                        },
                        formatInput: [
                          FilteringTextInputFormatter.deny(
                            RegExp(r'[/\\|_,]'),
                          ),
                        ],
                        icon: IconButton(
                          onPressed: () {
                            _passwordObscured = !_passwordObscured;
                            setState(() {});
                          },
                          icon: Icon(
                            _passwordObscured
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    kFingerPrint,
                  ],
                ),
                Row(
                  children: const [
                    Text('I agree to the'),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Terms of service',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Text('and'),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                SubmissionButton(
                  title: 'Create account',
                  onClicked: () {
                    setState(() {
                      if (userNameController.text.isEmpty ||
                          phoneNumberController.text.isEmpty ||
                          houseIDController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          passwordController.text.length < 8) {
                        _validate = true;
                      } else {
                        _validate = false;
                        phoneNumber = phoneNumberController.text;
                        phoneNumberController.clear();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return OtpConfirmation(
                            number: phoneNumber,
                          );
                        }));
                      }
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Row(
                    children: [
                      const Text('Joined us before?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

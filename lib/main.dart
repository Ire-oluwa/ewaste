import 'package:ewaste/screens/authentication_screens/forgot_password_screen.dart';
import 'package:ewaste/screens/authentication_screens/login_screen.dart';
import 'package:ewaste/screens/authentication_screens/registration_screen.dart';
import 'package:ewaste/screens/authentication_screens/reset_password_screen.dart';
import 'package:ewaste/screens/onboarding_screens/profile_screen_1.dart';
import 'package:ewaste/screens/onboarding_screens/profile_screen_2.dart';
import 'package:ewaste/screens/onboarding_screens/profile_screen_3.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProfileScreen1.id,
      routes: {
        ResetPassword.id: (context) => const ResetPassword(),
        LoginScreen.id: (context) => const LoginScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        ProfileScreen1.id: (context) => const ProfileScreen1(),
        ProfileScreen2.id: (context) => const ProfileScreen2(),
        ProfileScreen3.id: (context) => const ProfileScreen3(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

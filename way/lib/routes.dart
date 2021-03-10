import 'package:flutter/material.dart';
import 'package:way/models/destination_model.dart';
import 'package:way/screen/complete_profile/complete_profile_screen.dart';
import 'package:way/screen/destination/destination_screen.dart';
import 'package:way/screen/forgot_password/forgot_password_screen.dart';
import 'package:way/screen/home/home_screen.dart';
import 'package:way/screen/login_success/login_success_screen.dart';
import 'package:way/screen/otp/otp_screen.dart';
import 'package:way/screen/sign_in/sign_in_screen.dart';
import 'package:way/screen/sign_up/sign_up_screen.dart';
import 'package:way/screen/splash/splash_screen.dart';






final Map <String,WidgetBuilder> routes  = {

  SplashScreen.routeName:(context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName:(context) => OtpScreen(),
  HomeScreen.routeName:(context) => HomeScreen(),
  //DestinationScreen.routeName:(context) => DestinationScreen(),

};


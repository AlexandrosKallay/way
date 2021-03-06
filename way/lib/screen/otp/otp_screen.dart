import 'package:flutter/material.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName ="/otp";
  final firstNameHolder;
  final lastNameHolder;
  final phoneNumberHolder;
  final addressHolder;
  final emailHolder;
  final passwordHolder;
  final passwordConfirmHolder;

  OtpScreen({
    Key key,
    @required
    this.firstNameHolder,
    this.lastNameHolder,
    this.phoneNumberHolder,
    this.addressHolder,
    this.emailHolder,
    this.passwordHolder,
    this.passwordConfirmHolder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"
        ),
      ),
      body: Body(
          firstNameHolder: firstNameHolder,
          lastNameHolder: lastNameHolder,
          phoneNumberHolder: phoneNumberHolder,
          addressHolder: addressHolder,
          emailHolder:emailHolder,
          passwordHolder:passwordHolder,
          passwordConfirmHolder:passwordConfirmHolder
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName ="/otp";
  final firstNameHolder;
  final lastNameHolder;
  final phoneNumberHolder;
  final addressHolder;

  OtpScreen({
    Key key,
    @required
    this.firstNameHolder,
    this.lastNameHolder,
    this.phoneNumberHolder,
    this.addressHolder,
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
          addressHolder: addressHolder
      ),
    );
  }
}

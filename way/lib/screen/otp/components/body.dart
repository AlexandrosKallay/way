import 'package:flutter/material.dart';
import 'package:way/components/default_button.dart';
import 'package:way/constants.dart';
import 'package:way/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  final firstNameHolder;
  final lastNameHolder;
  final phoneNumberHolder;
  final addressHolder;
  final emailHolder;
  final passwordHolder;
  final passwordConfirmHolder;

  Body({
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
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text("OTP Verification", style: headingStyle,),
              Text("We send your code to +30 $phoneNumberHolder"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm( firstNameHolder: firstNameHolder,
                  lastNameHolder: lastNameHolder,
                  phoneNumberHolder: phoneNumberHolder,
                  addressHolder: addressHolder,
                  emailHolder:emailHolder,
                  passwordHolder:passwordHolder,
                  passwordConfirmHolder:passwordConfirmHolder
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: (){
                  //resend your OTP code
                },
                child: Text("Resend OTP Code",
                  style: TextStyle(decoration:
                  TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This code will expired in "),
            TweenAnimationBuilder(
                tween: Tween(begin: 30.0, end: 0),
                duration: Duration(seconds: 30),
                builder: (context, value, child) => Text(
                  "00:${value.toInt()}",
                  style: TextStyle(color: kPrimaryColor),
                ),
              onEnd: () {},
            ),
          ],
        );
  }
}


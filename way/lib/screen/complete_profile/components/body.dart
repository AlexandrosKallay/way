import 'package:flutter/material.dart';
import 'package:way/constants.dart';
import 'package:way/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {

  final  emailHolder;
  final  passwordHolder;
  final  passwordConfirmHolder;

  Body({
    Key key,
    @required
    this.emailHolder,
    this.passwordHolder,
    this.passwordConfirmHolder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text("Complete-Profile",
              style: headingStyle,
              ),
              Text("Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(emailHolder : emailHolder,
                passwordHolder: passwordHolder,
                passwordConfirmHolder: passwordConfirmHolder,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text("By continuing your confirm that you agree \n with our Term and Condition",
              textAlign: TextAlign.center,
              ),
            ]
          ),
        ),
      ),
    );
  }
}


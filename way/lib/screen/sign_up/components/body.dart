import 'package:flutter/material.dart';
import 'package:way/components/social_icons.dart';
import 'package:way/constants.dart';
import 'package:way/screen/sign_in/components/google_sign_in.dart';
import 'package:way/screen/sign_in/components/or_devider.dart';

import 'package:way/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight *0.02),
              Text("Register account",
                  style: headingStyle
              ),
              Text("Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight *0.07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight *0.04),
              OrDivider(),
              SizedBox(height: SizeConfig.screenHeight *0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: 'assets/icons/facebook.svg',
                    press: (){},
                  ),
                  GoogleSignIn(),
                  SocialIcon(
                    iconSrc: 'assets/icons/twitter.svg',
                    press: (){},
                  )
                ]
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text("By continuing your confirm that you agree \n with our Term and Condition",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}




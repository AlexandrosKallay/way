// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:way/components/firebase_auth.dart';
import 'package:way/components/no_account_text.dart';
import 'package:way/components/social_icons.dart';
import 'package:way/screen/home/home_screen.dart';

import 'package:way/size_config.dart';
import 'google_sign_in.dart';
import 'or_devider.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                        //color: Colors.black,
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Sign in with your email and password \nor continue with social media',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  OrDivider(),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
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
                  ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  NoAccountText()
                ],
              ),
            ),
          ),
        )
    );
  }
}





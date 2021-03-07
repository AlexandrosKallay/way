import 'package:flutter/material.dart';

import 'size_config.dart';


const kPrimaryColor = Color(0xFFFF8C69);
const kPrimaryLightColor = Color(0xFFFFFFFf);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xF03FAC9), Color(0xF04DCFC)],
);
const kSecondaryColor = Color(0xFF2E4756);
const kTextColor = Color(0xFF000000);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenHeight(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);


final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid Email";
const String kPassNullError = "Please enter your Password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Password don't match";
const String kNamelNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(10)),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
);

OutlineInputBorder outlineInputBorder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}
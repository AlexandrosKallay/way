import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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




const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kDarkThirdColor = Color(0xFF4B4B4B);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFF8C69);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  inputDecorationTheme: inputDecorationDarkTheme(),
  appBarTheme: appBarDarkTheme(),
  brightness: Brightness.dark,
  fontFamily: 'Muli',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kPrimaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'Muli',
    bodyColor: kLightSecondaryColor,
    displayColor: kLightSecondaryColor,
  ),
);

final kLightTheme = ThemeData(
  inputDecorationTheme: inputDecorationLightTheme(),
  appBarTheme: appBarLightTheme(),
  brightness: Brightness.light,
  fontFamily: 'Muli',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
    color: kPrimaryColor,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'Muli',
    bodyColor: kDarkSecondaryColor,
    displayColor: kDarkSecondaryColor,
  ),
);

AppBarTheme appBarLightTheme(){
  return AppBarTheme(
      centerTitle: true,
      color: kLightPrimaryColor,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: kPrimaryColor),
      textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Muli',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
  );
}

AppBarTheme appBarDarkTheme(){
  return AppBarTheme(
      centerTitle: true,
      color: kDarkPrimaryColor,
      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: kPrimaryColor),
      textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Muli',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),

  );
}

InputDecorationTheme inputDecorationDarkTheme(){
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kLightSecondaryColor),
      gapPadding: 10
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    fillColor: kPrimaryColor,
    focusColor: kPrimaryColor,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}




InputDecorationTheme inputDecorationLightTheme(){
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kDarkSecondaryColor),
      gapPadding: 10
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    fillColor: kPrimaryColor,
    focusColor: kPrimaryColor,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

// ignore: non_constant_identifier_names
BoxDecoration myDestinationBoxDecoration(BuildContext context) => BoxDecoration(
  color: Theme.of(context).primaryColor,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Theme.of(context).hintColor.withOpacity(0.15),
      offset: const Offset(0, 3),
      blurRadius: 2,
    ),
  ],
);

BoxDecoration myHotelBoxDecoration(BuildContext context) => BoxDecoration(
  color: Theme.of(context).primaryColor,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Theme.of(context).hintColor.withOpacity(0.15),
      offset: const Offset(0.0, 3.0),
      blurRadius: 2.0,
    ),
  ],
);

BoxDecoration mySearchBarBoxDecoration(BuildContext context) => BoxDecoration(
  color: Theme.of(context).primaryColor,
  borderRadius: BorderRadius.circular(22),
  boxShadow: [
    BoxShadow(
      color: Theme.of(context).hintColor.withOpacity(0.15),
      offset: const Offset(3.0, 3.0),
      blurRadius: 10.0,
      spreadRadius: -2,
    ),
  ],
);



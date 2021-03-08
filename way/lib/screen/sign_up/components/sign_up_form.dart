import 'package:flutter/material.dart';
import 'package:way/components/custom_surffix_icon.dart';
import 'package:way/components/default_button.dart';
import 'package:way/components/form_error.dart';
import 'package:way/constants.dart';
import 'package:way/screen/complete_profile/complete_profile_screen.dart';
import 'package:way/screen/complete_profile/components/complete_profile_form.dart';

import 'package:way/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompleteProfileScreen(
                emailHolder : emailController.text,
                passwordHolder : passwordController.text,
                passwordConfirmHolder : confirmPasswordController.text,
            )

        )
    );
  }

  final _formkey = GlobalKey<FormState>();
  String email;
  String password;
  // ignore: non_constant_identifier_names
  String conform_password;
  final List<String> errors = [];

  void addError({String error}){
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}){
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: (){
              if (_formkey.currentState.validate()){
                //go to home page
                getItemAndNavigate(context);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value){
        if(password == conform_password){
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kPassNullError);
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm password',
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/padlock.svg',
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/padlock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email=newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/envelope.svg',
        ),
      ),
    );
  }
}
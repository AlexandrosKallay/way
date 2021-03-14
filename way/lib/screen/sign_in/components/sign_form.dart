import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:way/components/custom_surffix_icon.dart';
import 'package:way/components/default_button.dart';
import 'package:way/components/form_error.dart';
import 'package:way/constants.dart';
import 'package:way/screen/forgot_password/forgot_password_screen.dart';
import 'package:way/screen/login_success/login_success_screen.dart';
import 'package:http/http.dart' as http;



import 'package:way/size_config.dart';
import 'package:way/state/currentUser.dart';




class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  String urlLogin = "http://slumberjer.com/myhelper/php/login_user.php";
  TextEditingController _emailController = TextEditingController();
  String _email = "";
  TextEditingController _passwordController = TextEditingController();
  String _password = "";

  void _loginUser(String email, String password, BuildContext context) async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try{
      if(await _currentUser.loginUser(email, password)){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginSuccessScreen())
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }

  final _formKey =GlobalKey<FormState>();
  final List<String> errors=[];
  String email;
  String password;
  bool _isChecked = false;


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
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  activeColor: kPrimaryColor,
                  onChanged: (bool value) {
                    _onChange(value);
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.popAndPushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text("Forgot password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: ('Continue'),
              press: (){
                if (_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  _loginUser(_emailController.text, _passwordController.text, context);

                }
              },
            ),
          ],
        )
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
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
      controller: _emailController,
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

  @override
  void initState() {
    loadpref();
    print('Init: $_email');
    super.initState();
  }

  void loadpref() async {
    print('Inside loadpref()');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = (prefs.getString('email'));
    _password = (prefs.getString('pass'));
    print(_email);
    print(_password);
    if (_email.length > 1) {
      _emailController.text = _email;
      _passwordController.text = _password;
      setState(() {
        _isChecked = true;
      });
    } else {
      print('No pref');
      setState(() {
        _isChecked = false;
      });
    }
  }


  void _onChange(bool value) {
    setState(() {
      _isChecked = value;
      savepref(value);
    });
  }

  void savepref(bool value) async {
    print('Inside savepref');
    _email =_emailController.text;
    _password = _passwordController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value) {
      //true save pref
      if (_isEmailValid(_email) && (_password.length > 5)) {
        await prefs.setString('email', _email);
        await prefs.setString('pass', _password);
        print('Save pref $_email');
        print('Save pref $_password');
        Toast.show("Preferences have been saved", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      } else {
        print('No email');
        setState(() {
          _isChecked = false;
        });
        Toast.show("Check your credentials", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    } else {
      await prefs.setString('email', '');
      await prefs.setString('pass', '');
      setState(() {
        _emailController.text = '';
        _passwordController.text = '';
        _isChecked = false;
      });
      print('Remove pref');
      Toast.show("Preferences have been removed", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }
  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }


}
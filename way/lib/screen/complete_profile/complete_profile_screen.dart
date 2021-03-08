import 'package:flutter/material.dart';
import 'components/body.dart';


class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  final  emailHolder;
  final  passwordHolder;
  final  passwordConfirmHolder;

  CompleteProfileScreen({
    Key key,
    @required
    this.emailHolder,
    this.passwordHolder,
    this.passwordConfirmHolder}) : super(key: key);

  goBack(BuildContext context){
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(emailHolder: emailHolder,
          passwordHolder: passwordHolder,
          passwordConfirmHolder: passwordConfirmHolder,
      ),
    );
  }
}

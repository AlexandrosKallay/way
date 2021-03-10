import 'package:flutter/material.dart';
import 'package:way/screen/sign_in/sign_in_screen.dart';

import 'firebase_auth.dart';


showAlertDialog(BuildContext context)  {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {},
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () {
        //signOutGoogle();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
              return SignInScreen();}),
            ModalRoute.withName('/'));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like Log out from your account?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
}

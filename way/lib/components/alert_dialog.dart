import 'package:flutter/material.dart';
import 'package:way/screen/sign_in/sign_in_screen.dart';



showAlertDialog(BuildContext context)  {

    // set up the buttons
    // ignore: deprecated_member_use
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {},
    );
    // ignore: deprecated_member_use
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

import 'package:flutter/material.dart';
import 'package:way/components/firebase_auth.dart';
import 'package:way/components/social_icons.dart';
import 'package:way/screen/home/home_screen.dart';

class GoogleSignIn extends StatefulWidget {
  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //signOutGoogle();
  }

  // void click() {
  //   signInWithGoogle().then((result) {
  //     if (result != null) {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) {
  //             return HomeScreen();
  //           },
  //         ),
  //       );
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SocialIcon(
      iconSrc: 'assets/icons/google-plus.svg',
      press: (){
      //   signInWithGoogle().then((result) {
      //   if (result != null) {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return HomeScreen();
      //         },
      //       ),
      //     );
      //   }
      // });
      },
    );
  }
}

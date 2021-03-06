import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:way/components/default_button.dart';
import 'package:way/constants.dart';
import 'package:way/screen/home/home_screen.dart';
import 'package:way/size_config.dart';
import 'package:way/state/currentUser.dart';


class OtpForm extends StatefulWidget {

  final emailHolder;
  final passwordHolder;
  final passwordConfirmHolder;
  final firstNameHolder;
  final lastNameHolder;
  final phoneNumberHolder;
  final addressHolder;

  OtpForm({
    Key key,
    @required
    this.firstNameHolder,
    this.lastNameHolder,
    this.phoneNumberHolder,
    this.addressHolder,
    this.emailHolder,
    this.passwordHolder,
    this.passwordConfirmHolder,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState(firstNameHolder,lastNameHolder,
      phoneNumberHolder,addressHolder,emailHolder,passwordHolder,passwordConfirmHolder
  );
}

class _OtpFormState extends State<OtpForm> {

  final firstNameHolder;
  final lastNameHolder;
  final phoneNumberHolder;
  final addressHolder;
  final emailHolder;
  final passwordHolder;
  final passwordConfirmHolder;

  _OtpFormState(this.firstNameHolder,
    this.lastNameHolder,
    this.phoneNumberHolder,
    this.addressHolder,
    this.emailHolder,
    this.passwordHolder,
    this.passwordConfirmHolder,
  );


  void _signUpUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      if (await _currentUser.signUpUser(email, password)) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "Password too weak") {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("the email already exist"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }


    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    String _verificationCode;
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(43, 46, 66, 1),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color.fromRGBO(126, 203, 224, 1),
      ),
    );


    // FocusNode pin2FocusNode;
    // FocusNode pin3FocusNode;
    // FocusNode pin4FocusNode;
    // FocusNode pin5FocusNode;
    // FocusNode pin6FocusNode;


    // @override
    // void dispose() {
    //   // TODO: implement dispose
    //   pin2FocusNode.dispose();
    //   pin3FocusNode.dispose();
    //   pin4FocusNode.dispose();
    //   pin5FocusNode.dispose();
    //   pin6FocusNode.dispose();
    //   super.dispose();
    // }


    // void nextField({String value, focusNode}) {
    //   if (value.length == 1) {
    //     focusNode.requestFocus();
    //   }
    // }


    @override
    Widget build(BuildContext context) {
      return Form(
          key: _scaffoldkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle: const TextStyle(
                      fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                          .then((value) async {
                        if (value.user != null) {
                          _signUpUser(emailHolder, passwordHolder, context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  HomeScreen()),
                                  (route) => false
                          );
                        } else {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text("invalid OTP"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      });
                    } catch (e) {
                      print(e);
                      // print('$e');
                      // FocusScope.of(context).unfocus();
                      // _scaffoldkey.currentState
                      //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                    }
                  },
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              // DefaultButton(
              //     text: "Continue",
              //     press: () async {
              //
              //     }
              // )
            ],
          )
      );
    }

    _verifyPhone() async {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+30${widget.phoneNumberHolder}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            await FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) async {
              if (value.user != null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
              }
            });
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);
          },
          codeSent: (String verficationID, int resendToken) {
            setState(() {
              _verificationCode = verficationID;
            });
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            setState(() {
              _verificationCode = verificationID;
            });
          },
          timeout: Duration(seconds: 120)
      );
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _verifyPhone();
    }

}

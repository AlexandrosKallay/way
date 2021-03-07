import 'package:flutter/material.dart';
import 'package:way/components/default_button.dart';
import 'package:way/constants.dart';
import 'package:way/size_config.dart';


class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField ({String value, focusNode}){
    if(value.length == 1){
      focusNode.requestFocus();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(30),
                  child: TextFormField(
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value){
                      //also you need to store your value
                      nextField(value: value,focusNode: pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(30),
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value){
                      nextField(value: value,focusNode: pin3FocusNode);
                    },

                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(30),
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value){
                      nextField(value: value,focusNode: pin4FocusNode);
                    },

                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(30),
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value){
                      pin4FocusNode.unfocus();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            DefaultButton(
              text: "Continue",
              press: (){},
            )

          ],
        )
    );
  }
}
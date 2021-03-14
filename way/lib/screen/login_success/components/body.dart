import 'package:flutter/material.dart';
import 'package:way/components/default_button.dart';
import 'package:way/screen/home/home_screen.dart';
import 'package:way/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          Center(
            child: Image.asset("assets/images/tick.png",
            height: SizeConfig.screenHeight * 0.3),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text("Login Success",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(30),
                fontWeight: FontWeight.bold,
                //color: Colors.black
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back home",
              press: () => Navigator.pushNamed(context, HomeScreen.routeName),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}

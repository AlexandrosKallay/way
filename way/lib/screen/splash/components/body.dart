import 'package:flutter/material.dart';
import 'package:way/components/default_button.dart';
import 'package:way/screen/sign_in/sign_in_screen.dart';

import 'package:way/size_config.dart';

import '../../../constants.dart';
import 'splash_content.dart';



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String,String>>splashData= [
    {
      'text': 'Welcome to Way, where we escape the ordinary.',
      'image': 'assets/images/splashscreen_1.png',
    },
    {
      'text': 'We help people get the best experience \n from different places around the world',
      'image': 'assets/images/splashscreen_2.png',
    },
    {
      'text': 'Welcome to Way, escape the ordinary.',
      'image': 'assets/images/splashscreen_3.png',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
                child: PageView.builder(
                  onPageChanged: (value){
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image'],
                  text: splashData[index]['text'],
                  ),
                )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashData.length, (index) => buildDot(index: index))
                    ),
                    Spacer(flex: 3,
                    ),
                    DefaultButton(
                      text: 'Continue',
                      press: (){
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
                  duration: kAnimationDuration,
                  margin: EdgeInsets.only(right: 5),
                  height: 6,
                  width: currentPage == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.circular(3)
                  ),
                );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:way/size_config.dart';


class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocialIcon({
    Key key, this.iconSrc, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: getProportionateScreenHeight(35),
        width: getProportionateScreenWidth(35),
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
        padding: EdgeInsets.all(getProportionateScreenWidth(2)),
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Color(0xFFFF8C69),
            ),
            shape:BoxShape.circle
        ),
        child: SvgPicture.asset(iconSrc,color: Color(0xFFFF8C69),
          height: getProportionateScreenHeight(5),
          width: getProportionateScreenWidth(5),
        ),
      ),
    );
  }
}

class TextIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;

  const TextIcon({
    Key key, this.iconSrc, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(getProportionateScreenWidth(2)),
        child: SvgPicture.asset(iconSrc,color: Color(0xFFFF8C69),
          height: getProportionateScreenHeight(20),
          width: getProportionateScreenWidth(20),
        ),
      ),
    );
  }
}
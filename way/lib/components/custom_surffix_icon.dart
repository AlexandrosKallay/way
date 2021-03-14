import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:way/constants.dart';
import 'package:way/size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key key,
    @required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(10),
      ),
      child: SvgPicture.asset(
        svgIcon,
        color: kPrimaryColor,
        height: getProportionateScreenHeight(20),
      ),
    );
  }
}
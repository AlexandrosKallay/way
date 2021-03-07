import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:way/constants.dart';
import 'package:way/size_config.dart';


class IconButtonWithCounter extends StatelessWidget {
  const IconButtonWithCounter({
    Key key,
    @required this.svcSrv,
    this.numOfItems = 0,
    @required this.press,
  }) : super(key: key);

  final String svcSrv;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(6)),
            height: getProportionateScreenWidth(23),
            width: getProportionateScreenWidth(23),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svcSrv),
          ),
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              height: getProportionateScreenWidth(8),
              width: getProportionateScreenWidth(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFF4848),
                  border: Border.all(width: 1.5,color: Colors.white)
              ),
              child: Center(
                child: Text('$numOfItems',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(5),
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

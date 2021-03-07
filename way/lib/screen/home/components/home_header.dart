import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_button_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconButtonWithCounter(
            svcSrv: 'assets/icons/bell.svg',
            numOfItems: 3,
            press: (){},
          )
        ],
      ),
    );
  }
}
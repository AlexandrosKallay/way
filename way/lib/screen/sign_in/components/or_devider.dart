import 'package:flutter/material.dart';

import '../../../constants.dart';





class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 10) ,
        width: size.width * 0.8,
        child:
        Row(
          children: [
            buildDevider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Text('OR', style: TextStyle(color: kPrimaryColor),
              ),
            ),
            buildDevider(),
          ],
        )
    );
  }

  Expanded buildDevider() {
    return Expanded(
        child:
        Divider(color: Color(0xFFFF8C69),
        )
    );
  }
}
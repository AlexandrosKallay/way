import 'package:flutter/material.dart';
import 'package:way/models/destination_model.dart';


// ignore: must_be_immutable
class Body extends StatefulWidget {
  Destination destination;
  Body(this.destination);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0 , 0.2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Image(image: AssetImage(widget.destination.imageUrl),),
            )
          ],
        )
      ],
    );
  }
}


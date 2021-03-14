import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:way/models/destination_model.dart';
import 'package:way/screen/destination/destination_screen.dart';


import '../constants.dart';
import '../size_config.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Text('Top Destinations',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    //color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: ()=> print('See All'),

                  child: Text('See All',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                )
              ]
          ),
        ),
        Container(
          height: getProportionateScreenWidth(120),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index){
                Destination destination = destinations[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(
                      builder: (_) => DestinationScreen(
                          destination
                      )
                    )
                  ),
                  child: Container(
                    margin: EdgeInsets.all(getProportionateScreenWidth(5.0)),
                    width: getProportionateScreenWidth(85),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget> [
                        Positioned(
                          bottom: getProportionateScreenWidth(6),
                          child: Container(
                            height: getProportionateScreenWidth(60),
                            width: getProportionateScreenWidth(85),
                            decoration: myDestinationBoxDecoration(context),
                            child: Padding(
                              padding: EdgeInsets.all(getProportionateScreenWidth(3)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${destination.activities.length} activities",
                                    style: TextStyle(
                                        //color: Colors.black ,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(destination.description,
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: myDestinationBoxDecoration(context),
                          child: Stack(
                            children: <Widget>[
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  colorBlendMode: BlendMode.saturation,
                                  height: getProportionateScreenWidth(75),
                                  width: getProportionateScreenWidth(75),
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: getProportionateScreenWidth(5),
                              bottom: getProportionateScreenWidth(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 14.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: getProportionateScreenWidth(5)),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]
                        )
                        )
                      ],
                    ),
                  ),
                );
              }
              ),
        )
      ],
    );
  }
}
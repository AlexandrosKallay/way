import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:way/size_config.dart';
import 'package:way/widgets/destination_carousel.dart';
import 'package:way/widgets/hotel_carousel.dart';
import '../../../constants.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: getProportionateScreenWidth(25),
        width: getProportionateScreenWidth(25),
          decoration: BoxDecoration(
            color:_selectedIndex == index
                ? kPrimaryColor.withOpacity(0.5)
                : Color(0xFFEAE2E2),
            borderRadius: BorderRadius.circular(30.0)
          ),
        child: Icon(
          _icons[index],
          size: getProportionateScreenWidth(10),
          color: _selectedIndex == index
              ? kPrimaryColor
              : Color(0xFF878686),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(

        // padding: EdgeInsets.symmetric(
        //     vertical: getProportionateScreenWidth(0)
        // ),
        children: <Widget>[
          //HomeHeader(),
            //padding: EdgeInsets.only(left: getProportionateScreenWidth(10.0), right: getProportionateScreenWidth(30.0)),
            // child: Text("Where would you like to go next?",
            //   style: headingStyle,
            // ),
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/way.jpg",
                height: getProportionateScreenWidth(100),
                width: getProportionateScreenWidth(300),
              fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("WAY",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(30),
                        color: Colors.white,
                        fontFamily: "muli",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                        height: 0.7
                    ),
                  ),
                  Text("The best way to get away.",
                      style: TextStyle(
                          fontSize:17,
                          color: Colors.white70),
                    ),
                ],
              ),
              Positioned(
                bottom: getProportionateScreenWidth(-10),
                child: Container(
                  width: getProportionateScreenWidth(135),
                  height: getProportionateScreenWidth(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    //border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.16),
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                    child: TextField(

                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search your destination…",
                        hintStyle: TextStyle(
                          fontSize: getProportionateScreenWidth(8),
                          color: Color(0xFF000000),
                        ),
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10),
                          vertical: getProportionateScreenWidth(5),
                        ),
                      ),
                    ),
                )
              )
            ]
          ),
          SizedBox(height: getProportionateScreenWidth(5)),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children:
          //     _icons.asMap().entries.map(
          //           (MapEntry map)=>_buildIcon(map.key),
          //     ).toList()
          // ),
          SizedBox(height: getProportionateScreenWidth(10)),
          DestinationCarousel(),
          SizedBox(height: getProportionateScreenWidth(2)),
          HotelCarousel(),
        ],
      ),
      // child: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children:[
      //       SizedBox(height: getProportionateScreenWidth(5)),
      //       //HomeHeader(),
      //       SizedBox(height: getProportionateScreenWidth(10)),
      //       //DiscountBanner(),
      //     ],
      //   ),
      // ),
    );
  }
}





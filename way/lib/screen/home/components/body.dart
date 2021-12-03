import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:way/size_config.dart';
import 'package:way/widgets/destination_carousel.dart';
import 'package:way/widgets/hotel_carousel.dart';
import 'package:way/widgets/image_carousel.dart';
import '../../../constants.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
        child: CustomScrollView(
        slivers: <Widget>[
          /*SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: CustomSliverAppBarDelegate(expandedHeight: getProportionateScreenWidth(75)),
          ),*/

          SliverFixedExtentList(

            itemExtent: getProportionateScreenWidth(135),
            delegate: SliverChildListDelegate(
              [
                CarouselDemo(),
                DestinationCarousel(),
                HotelCarousel(),
                //DestinationCarousel(),
                //CarouselDemo(),
                /*Container(color: Colors.green),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.pink),*/
              ],
            ),
          ),
        ],
      )
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    @required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    //CarouselDemo();
    final size = getProportionateScreenWidth(80);
    final top = expandedHeight - shrinkOffset - size / 2;




    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset),

        //buildAppBar(shrinkOffset),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
    opacity: appear(shrinkOffset),
    child: AppBar(
      automaticallyImplyLeading: false,
      title: Text("test"),
      centerTitle: true,
    ),
  );

  Widget buildBackground(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: SingleChildScrollView(
      child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CarouselDemo(),
                  /*Image.asset("assets/images/way.jpg",
                    height: getProportionateScreenWidth(70),
                    width: getProportionateScreenWidth(300),
                    fit: BoxFit.cover,
                  ),*/
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Text("WAY",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(30),
                            color: Colors.white,
                            fontFamily: "muli",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.0,
                            height: 0.5
                        ),
                      ),
                      Text("The best way to get away.",
                        style: TextStyle(
                            fontSize:17,
                            color: Colors.white70),
                      ),*/
                    ],
                  ),
              ]
            ),
    )
  );

  Widget buildFloating(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: Card(
      child: Row(
        children: [
          Expanded(child: buildSearchField(text: 'Search your destination…', icon: Icons.search)),
        ],
      ),
    ),
  );

  Widget buildSearchField({
    @required String text,
    @required IconData icon,
  }) =>
      TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(10),
            //color: Color(0xFF000000),
          ),
          suffixIcon: Icon(icon),
          contentPadding: EdgeInsets.symmetric(
          ),
        ),
      );


  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}






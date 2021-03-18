import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:way/size_config.dart';
import 'package:way/widgets/destination_carousel.dart';
import 'package:way/widgets/hotel_carousel.dart';
import '../../../constants.dart';

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

  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   forceElevated: true,
          //     automaticallyImplyLeading: false,
          //   pinned: false,
          //   floating: true,
          //   snap: false,
          //   elevation: 0.0,
          //   expandedHeight: getProportionateScreenWidth(100),
          //   flexibleSpace: FlexibleSpaceBar(
          //     background:Stack(
          //         clipBehavior: Clip.none,
          //         alignment: Alignment.center,
          //         children: [
          //           Image.asset("assets/images/way.jpg",
          //             height: getProportionateScreenWidth(100),
          //             width: getProportionateScreenWidth(300),
          //             fit: BoxFit.cover,
          //           ),
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text("WAY",
          //                 style: TextStyle(
          //                     fontSize: getProportionateScreenWidth(30),
          //                     color: Colors.white,
          //                     fontFamily: "muli",
          //                     fontWeight: FontWeight.w600,
          //                     letterSpacing: 2.0,
          //                     height: 1.9
          //                 ),
          //               ),
          //               Text("The best way to get away.",
          //                 style: TextStyle(
          //                     fontSize:17,
          //                     color: Colors.white70),
          //               ),
          //             ],
          //           ),
          //       ]
          //     )
          //   )
          // ),
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
                // child: PreferredSize(
                //   preferredSize: Size.fromHeight(40.0),
                //   child: Container(
                //     color: Theme.of(context).primaryColor,
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(2), horizontal: getProportionateScreenWidth(8)),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: <Widget>[

                //         ],
                //       ),
                //     ),
                //   ),
                // )
          ),
          SliverFixedExtentList(
            itemExtent: getProportionateScreenWidth(165),
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
                  child: DestinationCarousel(),
                ),
                HotelCarousel(),
                Container(color: Colors.green),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.pink),
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
    final size = 50;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset),

        buildAppBar(shrinkOffset),
        SizedBox(height: getProportionateScreenWidth(5)),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
    opacity: appear(shrinkOffset),
    child: AppBar(
      automaticallyImplyLeading: false,
      title: Text("tted"),
      centerTitle: true,
    ),
  );

  Widget buildBackground(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: Stack(
              clipBehavior: Clip.none,
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
                          height: 1.9
                      ),
                    ),
                    Text("The best way to get away.",
                      style: TextStyle(
                          fontSize:17,
                          color: Colors.white70),
                    ),
                  ],
                ),
            ]
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
      // TextButton(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(icon),
      //       const SizedBox(width: 12),
      //       Text(text, style: TextStyle(fontSize: 20)),
      //     ],
      //   ),
      //   onPressed: () {},
      // );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
    // return SafeArea(
    //   child: ListView(
    //
    //     // padding: EdgeInsets.symmetric(
    //     //     vertical: getProportionateScreenWidth(0)
    //     // ),
    //     children: <Widget>[
    //       //HomeHeader(),
    //         //padding: EdgeInsets.only(left: getProportionateScreenWidth(10.0), right: getProportionateScreenWidth(30.0)),
    //         // child: Text("Where would you like to go next?",
    //         //   style: headingStyle,
    //         // ),
    //       Stack(
    //         overflow: Overflow.visible,
    //         alignment: Alignment.center,
    //         children: [
    //           Image.asset("assets/images/way.jpg",
    //             height: getProportionateScreenWidth(100),
    //             width: getProportionateScreenWidth(300),
    //           fit: BoxFit.cover,
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text("WAY",
    //                 style: TextStyle(
    //                     fontSize: getProportionateScreenWidth(30),
    //                     color: Colors.white,
    //                     fontFamily: "muli",
    //                     fontWeight: FontWeight.w600,
    //                     letterSpacing: 2.0,
    //                     height: 0.7
    //                 ),
    //               ),
    //               Text("The best way to get away.",
    //                   style: TextStyle(
    //                       fontSize:17,
    //                       color: Colors.white70),
    //                 ),
    //             ],
    //           ),
    //           Positioned(
    //             bottom: getProportionateScreenWidth(-10),
    //             child: Container(
    //               width: getProportionateScreenWidth(135),
    //               height: getProportionateScreenWidth(20),
    //               decoration: mySearchBarBoxDecoration (context),
    //                 child: TextField(
    //                   onChanged: (value) {},
    //                   decoration: InputDecoration(
    //                     hintText: "Search your destination…",
    //                     hintStyle: TextStyle(
    //                       fontSize: getProportionateScreenWidth(8),
    //                       //color: Color(0xFF000000),
    //                     ),
    //                     suffixIcon: Icon(Icons.search),
    //                     contentPadding: EdgeInsets.symmetric(
    //                       horizontal: getProportionateScreenWidth(10),
    //                       vertical: getProportionateScreenWidth(5),
    //                     ),
    //                   ),
    //                 ),
    //             )
    //           )
    //         ]
    //       ),
    //       SizedBox(height: getProportionateScreenWidth(5)),
    //       // Row(
    //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       //   children:
    //       //     _icons.asMap().entries.map(
    //       //           (MapEntry map)=>_buildIcon(map.key),
    //       //     ).toList()
    //       // ),
    //       SizedBox(height: getProportionateScreenWidth(10)),
    //       DestinationCarousel(),
    //       SizedBox(height: getProportionateScreenWidth(2)),
    //       HotelCarousel(),
    //     ],
    //   ),
    // );





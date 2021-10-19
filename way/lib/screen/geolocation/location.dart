

import 'package:flutter/material.dart';

import 'location_detail.dart';

class locationScreen extends StatefulWidget {
  @override
  _locationScreenState createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: true,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('HOTELS', '10', 'assets/images/bali.jpg',
                      false, false, context),
                  _buildCard('RESTAURANTS', '26', 'assets/images/bali.jpg',
                      true, false, context),
                  _buildCard('EXPERIENCES', '14', 'assets/images/bali.jpg',
                      false, true, context),
                  _buildCard('SIGHTS', '36', 'assets/images/bali.jpg',
                      false, false, context),
                ],
              )),

        ],
      ),
    );
  }
}

Widget _buildCard(String name, String count, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 0.0, left: 20.0, right: 20.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => PlaceMapScreen(
                      assetPath: imgPath,
                      count: count,
                      placename: name,
                    )
                )
            );
          },
          child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                // Padding(
                //     padding: EdgeInsets.all(5.0),
                //     child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           isFavorite
                //               ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                //               : Icon(Icons.favorite_border,
                //               color: Color(0xFFEF7532),
                //           ),
                //         ],
                //     ),
                // ),
                Hero(
                    tag: imgPath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image.asset(imgPath,
                      height: 140,
                      width: 200,
                      fit: BoxFit.fill,
                      ),
                    )
                ),
                SizedBox(height: 7.0),
                Text(count,
                    style: TextStyle(
                        color: Color(0xFFCC8053),
                        fontFamily: 'Muli',
                        fontSize: 14.0)),
                Text(name,
                    style: TextStyle(
                        //color: Color(0xFF575E67),
                        fontFamily: 'Muli',
                        fontSize: 14.0)),
                // Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                // Padding(
                //     padding: EdgeInsets.only(left: 5.0, right: 5.0),
                //     child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           if (!added) ...[
                //             Icon(Icons.shopping_basket,
                //                 color: Color(0xFFD17E50), size: 12.0),
                //             Text('Add to cart',
                //                 style: TextStyle(
                //                     fontFamily: 'Varela',
                //                     color: Color(0xFFD17E50),
                //                     fontSize: 12.0))
                //           ],
                //           if (added) ...[
                //             Icon(Icons.remove_circle_outline,
                //                 color: Color(0xFFD17E50), size: 12.0),
                //             Text('3',
                //                 style: TextStyle(
                //                     fontFamily: 'Varela',
                //                     color: Color(0xFFD17E50),
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 12.0)),
                //             Icon(Icons.add_circle_outline,
                //                 color: Color(0xFFD17E50), size: 12.0),
                //           ]
                //         ]))
              ]))));
}
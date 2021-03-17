import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:way/models/activity_model.dart';
import 'package:way/models/destination_model.dart';
import 'package:way/size_config.dart';
import '../../constants.dart';



// ignore: must_be_immutable
class DestinationScreen extends StatefulWidget {
  Destination destination;
  DestinationScreen(this.destination);
  static String routeName = "/destination";
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(tabs: [
              Tab(text: "Preview"),
              Tab(text: "Activities"),
              Tab(text: "Reviews"),
            ]),
          ),
          Container(
            //Add this to give height
            height: getProportionateScreenWidth(157),
            child: TabBarView(children: [
              Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                       ListTile(
                        leading: Icon(Icons.preview, size: 20),
                        title: Text(
                          widget.destination.city,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        subtitle: Text(widget.destination.preview),
                      ),
                    ],
                  ),
                )
              ),
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      itemCount: widget.destination.activities.length,
                      itemBuilder: (BuildContext context, int index) {
                        Activity activity = widget.destination.activities[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), getProportionateScreenWidth(2), getProportionateScreenWidth(10), getProportionateScreenWidth(2)),
                              height: getProportionateScreenWidth(95),
                              width: double.infinity,
                              decoration: myHotelBoxDecoration(context),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(45),
                                    getProportionateScreenWidth(10),
                                    getProportionateScreenWidth(10),
                                    getProportionateScreenWidth(10)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: getProportionateScreenWidth(60),
                                          child: Text(
                                            activity.name,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              '\$${activity.price}',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'per pax',
                                              style: TextStyle(
                                                //color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      activity.type,
                                      style: TextStyle(
                                        //color: Colors.grey,
                                      ),
                                    ),
                                    _buildRatingStars(activity.rating),
                                    SizedBox(height: getProportionateScreenWidth(5)),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(getProportionateScreenWidth(2.8)),
                                          width: getProportionateScreenWidth(38),
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            activity.startTimes[0],
                                          ),
                                        ),
                                        SizedBox(width: getProportionateScreenWidth(5)),
                                        Container(
                                          padding: EdgeInsets.all(getProportionateScreenWidth(2.8)),
                                          width: getProportionateScreenWidth(38),
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            activity.startTimes[1],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: getProportionateScreenWidth(5),
                              top: getProportionateScreenWidth(15),
                              bottom: getProportionateScreenWidth(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  width: getProportionateScreenWidth(55),
                                  image: AssetImage(
                                    activity.imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                child: Text("Reviews"),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: myHotelBoxDecoration(context),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5),
                    vertical: getProportionateScreenWidth(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: getProportionateScreenWidth(5),
                bottom: getProportionateScreenWidth(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
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
                          size: 16.0,
                          color: Colors.white70,
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: getProportionateScreenWidth(5),
                bottom: getProportionateScreenWidth(5),
                child:Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              )
            ],
          ),
          _tabSection(context),

        ],
      ),
    );
  }
}


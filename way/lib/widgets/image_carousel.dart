


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

import '../size_config.dart';

class CarouselDemo extends StatelessWidget {


  CarouselController buttonCarouselController = CarouselController();





  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(1),vertical: getProportionateScreenWidth(1)),
        child:
              CarouselSlider(
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(1)),
                          decoration: BoxDecoration(
                              color: Colors.amber
                          ),
                          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height:  getProportionateScreenWidth(100),
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
              ),
        ),
      ]
  );
}
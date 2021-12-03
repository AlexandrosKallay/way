


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

import '../size_config.dart';

class CarouselDemo extends StatelessWidget {


  CarouselController buttonCarouselController = CarouselController();

  final List<String> imageList = [
    'assets/images/hotel0.jpg',
    'assets/images/hotel1.jpg',
    'assets/images/hotel2.jpg',
    'assets/images/temple.jpg',
    'assets/images/swing.jpg',
  ];





  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(1),vertical: getProportionateScreenWidth(1)),
        child:
              CarouselSlider(
                items: imageList.map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(e,
                      width: getProportionateScreenWidth(500),
                      height: getProportionateScreenWidth(100),
                      fit: BoxFit.cover,
                      )
                    ],
                  ),
                )).toList(),
                options: CarouselOptions(
                  height:  getProportionateScreenWidth(120),
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
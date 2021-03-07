import 'package:flutter/material.dart';
import '../../theme.dart';
import 'components/home.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  static String displayName;

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Navigation Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: HomePage(),
    );
  }
}



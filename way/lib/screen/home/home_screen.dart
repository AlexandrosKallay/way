import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import '../../routes.dart';
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
        theme: ThemeProvider.of(context),
        //home: HomePage(),
        initialRoute: HomePage.routeName,
        routes: routes,
    );
  }
}



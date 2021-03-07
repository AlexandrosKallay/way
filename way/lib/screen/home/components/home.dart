import 'package:flutter/material.dart';
import 'package:way/screen/home/components/body.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'discount_banner.dart';
import 'home_header.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Body();
      case 1:
        return new Container(
          width: 50,
          height: 90,
          color: Colors.blue,
        );
      case 2:
        return new Container(
          width: 50,
          height: 90,
          color: Colors.green,
        );
      case 3:
        return new Container(
          width: 50,
          height: 90,
          color: Colors.yellow,
        );

      default:
        return new Text("Error");
    }
  }

  List<String> titleList = ["Home", "Favorites", "Places", "Profile"];

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(

      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   leading: SizedBox(),
      //   title: Text(titleList[_currentIndex]),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Favorite'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Places'),
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: CircleAvatar(
              radius: 13.0,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
        ],
      ),
      body: _getDrawerItemWidget(_currentIndex),
    );
  }
}


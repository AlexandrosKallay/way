import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  List<String> titleList = ["", "", ""];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.onSurface,
      unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
      selectedLabelStyle: textTheme.caption,
      unselectedLabelStyle: textTheme.caption,
      onTap: (value) {
        // Respond to item press.
        setState(() => _currentIndex = value);
      },
      items: [
        BottomNavigationBarItem(
          title: Text(''), // ignore: deprecated_member_use
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text(''),// ignore: deprecated_member_use
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          title: Text(''),// ignore: deprecated_member_use
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          title: Text(''),// ignore: deprecated_member_use
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}

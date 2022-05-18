import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/like_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Color(0xFFD63965);
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          LikePage(),
          //MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outlined, color: _defaultColor),
            activeIcon: Icon(Icons.lightbulb_outlined, color: _activeColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded, color: _defaultColor),
            activeIcon:
                Icon(Icons.favorite_outline_rounded, color: _activeColor),
            label: 'Favorites',
          ),
        ],
        selectedItemColor: Color(0xFFD63965),
      ),
    );
  }
}

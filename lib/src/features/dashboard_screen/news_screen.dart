import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';




class NewsScreenPage extends StatefulWidget {
  @override
  _NewsScreenPageState createState() => _NewsScreenPageState();
}

class _NewsScreenPageState extends State<NewsScreenPage> {
  int _currentIndex = 0;
  int _selectedPage = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      body: Container(
        child: Center(
          child: Text('Page ${_currentIndex + 1}'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _selectedPage,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.menu, size: 30),
        ],
        color: Colors.blue,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 3) {
            _openDrawer();
          } else {
            _selectedPage = index;
          }
        },
      ),
    );
  }

  void _openDrawer() {
    _bottomNavigationKey.currentState?.setPage(_selectedPage);
    _scaffoldKey.currentState?.openDrawer();
  }
}
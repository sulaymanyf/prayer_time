import 'package:flutter/material.dart';
import 'package:prayer_imes/pages/current_time_page.dart';
import 'package:prayer_imes/pages/paryer_info_page.dart';
import 'package:prayer_imes/pages/profile_detail_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[CurrentTimePage(), PrayerInfoPage(),ProfileDetail() ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed, //lable 固定显示
        items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _defaultColor,
          ),
          activeIcon:  Icon(
            Icons.home,
            color: _activeColor,
          ),
          title: Text('Home',style:TextStyle(
            color:_currentIndex !=0?_defaultColor:_activeColor
          ),)
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            activeIcon:  Icon(
              Icons.search,
              color: _activeColor,
            ),
            title: Text('ara',style:TextStyle(
                color:_currentIndex !=1?_defaultColor:_activeColor
            ),)
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _defaultColor,
            ),
            activeIcon:  Icon(
              Icons.account_circle,
              color: _activeColor,
            ),
            title: Text('me',style:TextStyle(
                color:_currentIndex !=2?_defaultColor:_activeColor
            ),)
        ),

      ],),
    );
  }
}

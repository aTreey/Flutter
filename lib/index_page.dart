import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_flutter/category_page.dart';
import 'package:app_flutter/community_page.dart';
import 'package:app_flutter/home_page.dart';
import 'package:app_flutter/profile_page.dart';
import 'package:app_flutter/test_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('社区')
    ),

    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.car_detailed),
      title: Text('理想')
    ),

    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('我')
    ),

    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('分类')
    ),

    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('测试')
    )
  ];

  final List<Widget> tabPages = [
    HomePage(),
    CommunityPage(),
    CategoryPage(),
    ProfilePage(),
    TestPage()
  ];

  int currentIndex = 0;
  var currentPage;

  // 初始化
  @override
  void initState() {
    currentPage = tabPages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomItems,
        onTap: (index){
          setState(() {
            currentIndex = index; 
            currentPage = tabPages[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
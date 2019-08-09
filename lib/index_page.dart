import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_flutter/category_page.dart';
import 'package:app_flutter/community_page.dart';
import 'package:app_flutter/home_page.dart';
import 'package:app_flutter/profile_page.dart';
import 'package:app_flutter/test_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    // 初始化设置适配尺寸
    ScreenUtil.instance=ScreenUtil(width: 750, height: 1334)..init(context);
    print('屏幕宽度：${ScreenUtil.screenWidth}');
    print('屏幕高度：${ScreenUtil.screenHeight}');
    print('设备像素密度：${ScreenUtil.pixelRatio}');
    print('状态栏高度:${ScreenUtil.statusBarHeight}px');
    print('底部安全区距离:${ScreenUtil.bottomBarHeight}');
    print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
    print('宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}'); 
    print('高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}'); 
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');  
    
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

      // TODO: IndexedStack 是一个堆栈
      body: IndexedStack(
        index: currentIndex,
        children: tabPages,
      ),
    );
  }
}
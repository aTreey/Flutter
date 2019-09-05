// 导入头文件
import 'package:app_flutter/flutter_study/custom_bottom_appBar.dart';
import 'package:app_flutter/flutter_study/pages/flutter_study_screen.dart';
import 'package:app_flutter/flutter_study/pages/launch_animation_screen.dart';
import 'package:app_flutter/index_page.dart';
import 'package:app_flutter/provide_state/category_provide.dart';
import 'package:app_flutter/provide_state/childcategory_goodList_provide.dart';
import 'package:app_flutter/provide_state/childcategory_provide.dart';
import 'package:app_flutter/provide_state/counter_demo_provide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provide/provide.dart';


/*
 * flutter 项目 App 入口 
 */
void main(){
  // TODO: 2. 需要在main 绑定两者关系, ProviderNode 
  var providers=Providers();
  var counter=CounterProvide();
  var categoryProvide=CategoryProvide();
  var categoryItemProvide = ChildCategoryItemProvide();
  var categoryGoodsListProvide=CategoryGoodsListProvide();

  // 将provide 放入顶层
  providers
    ..provide(Provider<CounterProvide>.value(counter))
    ..provide(Provider<CategoryProvide>.value(categoryProvide))
    ..provide(Provider<ChildCategoryItemProvide>.value(categoryItemProvide))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    
    ;

  runApp(
    ProviderNode(
      child: MyApp(), 
      providers: providers)
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "flutter APP",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: IndexPage(),
      ),
    );
  }
}


/*
 * flutter tabBar、保持状态、列表、搜索等控件学习 app 入口 
 */

// void main(List<String> args) {
//   runApp(
//     BottomNavigationDemoApp()
//   );
// }

class BottomNavigationDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 底部导航栏 demo',
      theme: ThemeData.light(), // 设置主题
      home: LaunchAnimation() // 自定义的底部导航栏组件
    );
  }
}



/*
 * 底部tabBar自定义按钮 app 入口 
 * 通用试图eachView 的使用
 */

// void main(List<String> args) {
//   runApp(
//     CustomBottomAppBarApp()
//   );
// }


/*
 * 列表组件、导航、返回传值demo 入口 
 * 通用试图eachView 的使用
 */
// void main() => runApp(MyWidgetApp(
//   // 声明一个数组
//   items: List<String>.generate(1000, (i) => "item $i")
// ));

// 定义类, 继承

class MyWidgetApp extends StatelessWidget {
  // 声明参数
  final List<String> items;
  // 构造函数
  MyWidgetApp({Key key, @required this.items}):super(key: key); // 调用父类的方法
  // 重写
  @override
  Widget build(BuildContext context) {
    // 返回一窗口
    return MaterialApp(
      title:'Flutter --',
      // 基础组件学习
      // home: MyLearningFlutterHome(),
      // home: FirstScreen(),
      // 1.商品列表
      home: ProductListView(
        // 初始化数据
        products: List.generate(
          20, 
          (i) => Product('商品 $i', 'Product desc $i')
        ),
      )
    );
  }
}

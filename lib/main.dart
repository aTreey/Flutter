// 导入头文件
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'bottom_navigation_widget.dart';
import 'custom_bottom_appBar.dart';



//////// 底部tabBar构建 ////////////////////////
///

void main(List<String> args) {
  runApp(
    BottomNavigationDemo()
  );
}

class BottomNavigationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 底部导航栏 demo',
      theme: ThemeData.light(), // 设置主题
      home: BottomNavigationWidget() // 自定义的底部导航栏组件
    );
  }
}



//////////////// 底部tabBar自定义按钮///////////////////////////////
// 通用试图eachView 的使用
// void main(List<String> args) {
//   runApp(
//     CustomBottomAppBarApp()
//   );
// }



////////////////////////// 基础组件学习/////////////////////////////

// void main() => runApp(MyApp(
//   // 声明一个数组
//   items: List<String>.generate(1000, (i) => "item $i")

// ));

// 定义类, 继承

class MyApp extends StatelessWidget {

  // 声明参数
  final List<String> items;

  // 构造函数
  MyApp({Key key, @required this.items}):super(key: key); // 调用父类的方法


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




//// 商品类

class Product {
  final String title; // 定义商品标题
  final String description;
  // 定义构造方法
  Product(this.title, this.description);
}

// 1.商品列表
class ProductListView extends StatelessWidget {
  // 定义变量，里面是一个对象
  final List<Product> products;
  
  // 使用构造方法 函数的方式接受参数
  ProductListView({Key key, @required this.products}):super(key:key); // 设置必参，调用父类方法

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),

      // 使用 ListView.builder 动态构建
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            onLongPress: (){
              print("长按事件响应");
            },


            // 点击时传入参数
            onTap: (){
              print('点击事件');
              // Navigator.push(
              //   context, 
              //   MaterialPageRoute(
              //     builder: (context) => ProducterDetailView(product:products[index])
              //   )
              // );
              _jump2ProductDetailPage(context, products[index]);
            },
          );
        },
      ),
    );
  }


  // 跳转详情页面并处理返回的参数
  _jump2ProductDetailPage(BuildContext context, product) async {
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => ProducterDetailView(product: product))
    );

    // 接受回传的参数 result
    
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('返回的参数是：$result')));
  }
}

// 商品详情页面
class ProducterDetailView extends StatelessWidget {
  final Product product;

  ProducterDetailView({Key key, @required this.product}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product ${product.title} 详情页面')
      ),
      
      body: Center(
        // 有多控件
        child: Column(
          children: <Widget>[
            Image.asset('lib/assets/ideaOne.png'),
            Text('Product ${product.title} desc ${product.description}'),
            RaisedButton(
              child: Text('back Product List'),
              color: Colors.blue,
              onPressed: (){
                Navigator.pop(context, 'selected Id = ${product.title}');
              },
            )
          ],
        ),
      ),
    );
  }
}


///// 页面导航

// 

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('第一个页面'),
      ),

      body: Center(
        child: RaisedButton(
          child: new Text('点击跳转详情页'),
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
              builder: (context) => (new SecondScreen())
              // builder: (context){
              //   new SecondScreen();
              // }
            ));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页面')
      ),

      body: Center(
        child: RaisedButton(
          child: Text('返回上一级页面'),

          onPressed: () => (Navigator.pop(context)),

          // onPressed: (){
          //   Navigator.pop(context);
          // },
        ), 
      ),
    );
  }
}



class MyLearningFlutterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter 基础组件和布局学习'),
      ),

      body: Mycenter(),
    );
  }
}

class Mycenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //   // child: Mycontainer1(),
        //   // child: new MyContainer2(),
        //   // child: new MyImage(),
        // child: MyListView(),
        // child: MyNetworkingImageListView(),
        // child: MyListViewBuilder(),
        // child: MyListViewSeparated(context),
        // child: MyHorizontalListView(),


        // child: new ListView.builder(
        //   itemCount: items.length,
        //   itemBuilder: (context, index){
        //     return ListTile(
        //       title: new Text('我是动态列表${items[index]}'),
        //     );
        //   },
        // ),


        // 通过参数创建
        // child: MyDynamicListView(key: key, items: items),

        // child: MyGridView(),

        // child: MyGridView2(),

// 布局
        // child: MyRowNoChangeLayout(),

        // child: MyRowAutoLayout(),

        // child: MyRowLayout(),

          // child: MyColunmLayout(),

          // child: MyStackLayout(),

          // child: MyMoreStackLayout(),

          // child: MyCardLayout(),
    );
  }
}


///// 布局/////

/// CardView 布局

class MyCardLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child:  Column(
        children: <Widget>[
          new ListTile(
            title: new Text('card 布局1'),
            subtitle: new Text('子标题1', 
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.lightGreen
              ),
            ),
            leading: new Icon(Icons.account_balance, color: Colors.purple)
          ),
          
          new Divider(
            color: Colors.cyan
          ),

          new ListTile(
            title: new Text('card 布局2'),
            subtitle: new Text('子标题2', 
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.lightGreen
              ),
            ),
            leading: new Icon(Icons.account_box, color: Colors.yellow)
          ),

          new Divider(
            color: Colors.red,
          ),

          new ListTile(
            title: new Text('card 布局3'),
            subtitle: new Text('子标题3', 
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.lightGreen
              ),
            ),
            leading: new Icon(Icons.account_circle, color: Colors.red)
          ),

          new Divider(
            color: Colors.orangeAccent,
          ),

          new ListTile(
            title: new Text('card 布局4'),
            subtitle: new Text('子标题4', 
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.lightGreen
              ),
            ),
            leading: new Icon(Icons.camera_enhance, color: Colors.brown)
          )
        ],
      ),
    );
  }
}


/// 线性布局

// column 方向布局
class MyColunmLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.cyan,
         child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             new RaisedButton (
               onPressed: (){
                 print('点击了---- 红色');
               },

               color: Colors.red,
               child: new Text('按钮一红色'),
              ),
             
             Expanded(
               child: new RaisedButton(
               onPressed: (){
                 print('点击了---- 绿色');
               },
               color: Colors.green,
               child: new Text('按钮一绿色'),
              ),
             ),
             

              new Text('文字内容',
                textAlign: TextAlign.center,
              ),
              new Text('测试文字',
                textAlign: TextAlign.right,
              )
           ],
      ),
    );
  }
}


// Row 水平方向布局
// 1. 不可变布局, 三个button布局

class MyRowNoChangeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
         child: Row(
           children: <Widget>[
             new RaisedButton(
               onPressed: (){
                 print('点击了---- 红色');
               },

               color: Colors.red,
               child: new Text('按钮一红色'),
               
             ),

             new RaisedButton(
               onPressed: (){
                 print('点击了---- 黄色');
               },

               color: Colors.yellow,
               child: new Text('按钮一黄色'),
               
             ),
             new RaisedButton(
               onPressed: (){
                 print('点击了---- 绿色');
               },

               color: Colors.green,
               child: new Text('按钮一绿色'),
               
             )
           ],
      ),
    );
  }
}

// 2. 可变布局

class MyRowAutoLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
         child: Row(
           children: <Widget>[
             Expanded(
               child: new RaisedButton(
               onPressed: (){
                 print('点击了---- 红色');
               },

               color: Colors.red,
               child: new Text('按钮一红色'),
              ),
             ),

             Expanded(
               child: new RaisedButton(
               onPressed: (){
                 print('点击了---- 黄色');
               },

               color: Colors.yellow,
               child: new Text('按钮一黄色'),
               
             )
             ),
             
             Expanded(
               child: new RaisedButton(
               onPressed: (){
                 print('点击了---- 绿色');
               },

               color: Colors.green,
               child: new Text('按钮一绿色'),
               
              )
             )
           ],
      ),
    );
  }
}

// 混合使用
class MyRowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
         child: Row(
           children: <Widget>[
             new RaisedButton(
               onPressed: (){
                 print('点击了---- 红色');
               },

               color: Colors.red,
               child: new Text('按钮一红色'),
              ),

             Expanded(
               child: new RaisedButton(
               onPressed: (){
                 print('点击了---- 黄色');
               },

               color: Colors.yellow,
               child: new Text('按钮一黄色'),
               
             )
             ),
             
             new RaisedButton(
               onPressed: (){
                 print('点击了---- 绿色');
               },

               color: Colors.green,
               child: new Text('按钮一绿色'),
               
              )
           ],
      ),
    );
  }
}


// stack层叠布局

class MyStackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Stack(
      // 设置位置
      alignment: const FractionalOffset(0.5, .9),

      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('https://p.ampmake.com/mall/product/26153760-b964-45d5-b811-7f2bf5844102.jpg'),
          // backgroundImage: new Image.network('https://p.ampmake.com/mall/product/26153760-b964-45d5-b811-7f2bf5844102.jpg'),
          radius: 100.0,
        ),
        
        new Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.red,
              width: 3,
            ),
          ),
          
          padding: const EdgeInsets.all(10.0),
          child: new Text('stack 布局',
            textAlign: TextAlign.center,
            maxLines: 1,
            
            style: TextStyle(
              color: Colors.yellow,
              textBaseline: TextBaseline.ideographic,
              decoration: TextDecoration.underline,
              decorationColor: Colors.orange,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
        )
      ],
      
    );
  }
}


/// 多组件层叠布局
class MyMoreStackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: NetworkImage('https://p.ampmake.com/mall/product/26153760-b964-45d5-b811-7f2bf5844102.jpg'),
          radius: 100.0,
        ),

        new Positioned(
          top: 5,
          left: 50,
          // right: 5,
          width: 100,
          child: new RaisedButton(
            onPressed: (){
              print("多个组件层叠布局");
            },
            
            color: Colors.deepOrange,
            child: Text('测试按钮'),
          ),
        ),
        
        new Positioned(
          bottom: 10,
          right: 10,
          left: 10,
          child: new Text('flutter 多个试图 stack布局',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontStyle: FontStyle.italic
            ),
          )
        )
      ],
    );
  }
}

///// 控件/////

class MyGridView2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new GridView(
        // 设置边距
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          
          // 横轴 数量
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10.0,  
          // 宽高比：默认是1.0        
          childAspectRatio: 1.5,
        ),

        children: <Widget>[
          new Image.network('https://github.com/Jinxiansen/SwiftUI/raw/master/images/example/Text.png', fit: BoxFit.cover),
        new Image.network('https://p.ampmake.com/mall/product/9666f00e-f02a-46ce-9b7c-090bf6aba9aa.png', fit: BoxFit.cover),
        new Image.network('https://p.ampmake.com/mall/product/d6fdc891-eec3-47ce-b837-df726c73a9b8.png', fit: BoxFit.cover),
        new Image.network('https://p.ampmake.com/mall/product/0cccf224-57d1-4a3e-bf06-9df5fed0f4e0.png', fit: BoxFit.cover),
        new Image.network('https://p.ampmake.com/mall/product/2bf5c0d7-dc3a-45d2-ab1b-40fe737aa79a.jpg', fit: BoxFit.cover),
        new Image.network('https://p.ampmake.com/mall/product/26153760-b964-45d5-b811-7f2bf5844102.jpg', fit: BoxFit.cover),
        new Image.network('https://p.ampmake.com/mall/product/a20bb53c-b710-4b39-9607-91bef06ee54e.png', fit: BoxFit.cover),
        ],
      )
    );
  }
}

// MyGridView 布局
class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new GridView.count(
        padding: const EdgeInsets.all(20.0),
        // 横轴 item 数量
        crossAxisCount: 3,
        // 横轴 间距
        crossAxisSpacing: 20.0,
        children: <Widget>[
          const Text('我是第一个'),
          const Text('我是第二个'),
          const Text('我是第三个'),
          const Text('我是第四个'),
          const Text('我是第五个'),
          const Text('我是第六个'),
          const Text('我是第七个'),
        ],
      ),
    );
  }
}

// 动态列表

class MyDynamicListView extends StatelessWidget {
  // 声明参数
  final List<String> items;
  // 构造方法
  MyDynamicListView({Key key, @required this.items}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return ListTile(
              title: new Text('通过构造方法创建的动态列表${items[index]}'),
            );
          },
        ),
    );
  }
}

// 横向滚动列表
class MyHorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        // 设置滚动方式
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: 180.0,
            color: Colors.green,
          ),
          new Container(
            width: 180.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 180.0,
            color: Colors.blue,
          ),
          new Container(
            width: 180.0,
            color: Colors.cyan,
          ),
          new Container(
            width: 180.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}


// listView 分割线
class MyListViewSeparated {
  @override
  Widget build(BuildContext context){
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.black,
        );
      }
    );
  }
}

//  ListView.builder 的使用

class MyListViewBuilder extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: 100, // 数量
      itemExtent: 40, // Tile 高度
      itemBuilder: (BuildContext context, int index){
        return ListTile(title: Text("$index"));
      }
    ); 
  }
}



// 列表 listView 的使用

class MyNetworkingImageListView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        new Image.network('https://github.com/Jinxiansen/SwiftUI/raw/master/images/example/Text.png'),
        new Image.network('https://p.ampmake.com/mall/product/9666f00e-f02a-46ce-9b7c-090bf6aba9aa.png'),
        new Image.network('https://p.ampmake.com/mall/product/d6fdc891-eec3-47ce-b837-df726c73a9b8.png'),
        new Image.network('https://p.ampmake.com/mall/product/0cccf224-57d1-4a3e-bf06-9df5fed0f4e0.png'),
        new Image.network('https://p.ampmake.com/mall/product/2bf5c0d7-dc3a-45d2-ab1b-40fe737aa79a.jpg'),
        new Image.network('https://p.ampmake.com/mall/product/26153760-b964-45d5-b811-7f2bf5844102.jpg'),
        new Image.network('https://p.ampmake.com/mall/product/a20bb53c-b710-4b39-9607-91bef06ee54e.png'),
      ],
      
    );
  }
}

class MyListView extends StatelessWidget{
  @override
  Widget build(BuildContext contex){
    
    return ListView(
      children: <Widget>[
        new ListTile(
              leading: new Icon(Icons.camera),
              title: Text('相册'),
            ),
            
            new ListTile(
              leading: new Icon(Icons.camera_alt),
              title: Text('相机'),
            ),

            new ListTile(
              leading: new Icon(Icons.camera_enhance),
              title: Text('相机1'),
            ),

            new ListTile(
              leading: new Icon(Icons.camera_front),
              title: Text('相机2'),
            ),

            new ListTile(
              leading: new Icon(Icons.camera_rear),
              title: Text('相机3'),
            ),
      ],
    );
  }
}



// 图片使用
class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      child: new Image.network(
        // 'https://images.xiaozhuanlan.com/photo/2019/28ed76123023e46483fcf0ae5c2ba11b.png',
        'https://p.ampmake.com/mall/product/9666f00e-f02a-46ce-9b7c-090bf6aba9aa.png',

        // 1. 设置填充模式
        // fit: BoxFit.scaleDown,
        // fit: BoxFit.none,
        // fit: BoxFit.fill,
        // fit: BoxFit.fitHeight,
        // fit: BoxFit.fitWidth,

        // 保持原图比例
        // fit: BoxFit.contain,

        // 充满整个容器，图片被裁切
        // fit: BoxFit.cover,
        // scale: 1.0,

        // 2. 图片混合
        color: Colors.red,
        colorBlendMode: BlendMode.overlay,
        
        // 3. reap
        repeat: ImageRepeat.repeat,
      ),
      width: 300.0,
      height: 200.0,
      color: Colors.lightBlue,
    );
  }
}

// Container 2 容器组件， margin、padding 属性

class MyContainer2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      
      alignment: Alignment.topLeft, // 容器中内容对其方式
      width: 600.0,
      height: 300.0,

      // 设置容器内的文字的各个边距为10
      // padding: const EdgeInsets.all(10), // 容器内边距

      // 分别设置子控件的边距
      padding: const EdgeInsets.fromLTRB(16, 2, 0, 0),

      // container 和外部控件的边距
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0), 
    
      // 添加渐变
      decoration: new BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.lightBlue, Colors.greenAccent, Colors.yellow]
        ),

        // 设置 border 的宽度
        border: Border.all(width: 5, color: Colors.black) 

      ),

      // 文字内容
      child: Text('Container 容器中有文字',
        style: TextStyle(
          backgroundColor: Colors.cyan,
        ),
      ),
      
    );
  }
}

//  Container 1 对齐方式
class Mycontainer1 extends StatelessWidget {
  @override 
  Widget build(BuildContext contenxt) {
    return Container(
      child: Text('hellow flutter', 
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.orange
        ),
      ),
      width: 500.0,
      height: 400.0,
      color: Colors.lightGreen,
      alignment: Alignment.center,
    );
  }
}


//  Text 组件
class MyText extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Text('reacctNative、 flutter 学习之路是非常坚信不疑的，作为一个程序员，因该对于技术有着追求，不断的提高自己才是王道，可是道理都懂依然过不好这一生',
      maxLines: 2,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.deepOrange,
        decoration: TextDecoration.underline,
        decorationColor: Colors.redAccent,
        decorationStyle: TextDecorationStyle.dotted
      ),
    );
  }
}
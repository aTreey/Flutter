import 'package:flutter/material.dart';

class FlutterStudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterStudyListView(
        // 初始化数据
      datas: _initData()
      )
    );
  }
  _initData() {
    List<Product> datas = List();
    return datas
    ..add(Product('Text', '文本组件'))
    ..add(Product('Container', '容器组件'))
    ..add(Product('Container margin padding', '内、外边距'))
    ..add(Product('Image.network', '网络图片'))
    ..add(Product('ListView', 'ListView 组件'))
    ..add(Product('ListTile', 'ListTile 组件'))
    ..add(Product('NetworkingImageListView', 'listView 加载网络图片'))
    ..add(Product('ListView.builder', 'ListView.builder动态构建'))
    ..add(Product('HorizontalListView', '横向滚动列表'))
    ..add(Product('GridView', '分组试图'))
    ..add(Product('GridView2', 'GridView实现九宫格'))
    ..add(Product('StackLayout_Positioned', 'Stack多组件层叠布局'))
    ..add(Product('StackLayout', '层叠布局'))
    ..add(Product('column线性布局', 'column 线性垂直布局'))
    ..add(Product('row线性布局', 'row线性水平布局'))
    ..add(Product('NoChangeLayout', '不可变布局'))
    ..add(Product('AutoLayout', '可变布局'))
    ..add(Product('layout', '混合布局'));
  }
}

/// 
class Product {
  final String title;
  final String description;
  // 定义构造方法
  Product(this.title, this.description);
}

// 1. flutter 组件列表
class FlutterStudyListView extends StatelessWidget {
  // 定义变量，里面是一个对象
  final List<Product> datas;
  
  // 使用构造方法 函数的方式接受参数
  FlutterStudyListView({Key key, @required this.datas}):super(key:key); // 设置必参，调用父类方法

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('点击了按钮');
        },

        tooltip: '更多操作',
        
        child: Icon(
          Icons.add,
          color: Colors.red
        ),
      ),

      // 设置底部
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),

      appBar: AppBar(
        title: Text('Flutter组件列表'),
      ),

      // 使用 ListView.builder 动态构建
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(datas[index].title),
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
              _jump2DetailPage(context, datas[index]);
            },
          );
        },
      ),
    );
  }


  // 跳转详情页面并处理返回的参数
  _jump2DetailPage(BuildContext context, item) async {
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => FlutterWidgetDetailView(item: item))
    );

    // 接受回传的参数 result
    
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('返回的参数是：$result')));
  }
}

// 组件详情页面
class FlutterWidgetDetailView extends StatelessWidget {
  final Product item;

  FlutterWidgetDetailView({Key key, @required this.item}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${item.title} 组件')
      ),
      
      body: _initBody(item)
      
      // Center(
      //   // 有多控件
      //   child: Column(
      //     children: <Widget>[
      //       Image.asset('lib/assets/ideaOne.png'),
      //       Text('Product ${item.title} desc ${item.description}'),
      //       RaisedButton(
      //         child: Text('back'),
      //         color: Colors.blue,
      //         onPressed: (){
      //           Navigator.pop(context, 'selected Id = ${item.title}');
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  _initBody(Product item){
    if (item.title == 'Text') {
      return MyText();
    } 
    else if (item.title == 'Container') {
      return Mycontainer1();
    }
    else if (item.title == 'Container margin padding') {
      return MyContainer2();
    }
    else if (item.title == 'Image.network') {
      return MyImage();
    }

    else if (item.title == 'ListView') {
      return MyListView();
    }

    else if (item.title == 'ListTile') {
      return MyListView();
    }

    else if (item.title == 'NetworkingImageListView') {
      return MyNetworkingImageListView();
    }

    else if (item.title == 'ListView.builder') {
      return MyListViewBuilder();
    }

    else if (item.title == 'HorizontalListView') {
      return MyHorizontalListView();
    }

    else if (item.title == 'GridView') {
      return MyGridView();
    }
    else if (item.title == 'GridView2') {
      return MyGridView2();
    }
    else if (item.title == 'StackLayout_Positioned') {
      return MyMoreStackLayout();
    }
    else if (item.title == 'StackLayout') {
      return MyStackLayout();
    }
    else if (item.title == 'column线性布局') {
      return MyColunmLayout();
    }
    else if (item.title == 'row线性布局') {
      return MyRowNoChangeLayout();
    }
    else if (item.title == 'NoChangeLayout') {
      return MyRowNoChangeLayout();
    }
    else if (item.title == 'AutoLayout') {
      return MyRowAutoLayout();
    }
    // 混合使用
    else if (item.title == 'layout') {
      return MyRowLayout();
    }

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
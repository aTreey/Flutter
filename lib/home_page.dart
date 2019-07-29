import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/service/service_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String homePageContent='加载中...';

  @override
  void initState() {
    // getCommunityData().then((value){
    //   setState(() {
    //     // 
    //     homePageContent=value.toString();
    //   });
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('首页'),
      // ),
      body: SingleChildScrollView(
        //TODO: 使用FutureBuilder 等待异步请求的数据回来之后再渲染，不需要使用动态组件设置setState方法
        child: FutureBuilder(
          // 接受的是异步方法
          future: getGeekBangListData(),
          // 执行异步方法的时候执行的操作
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              
              case ConnectionState.none:
                print('snapshot none');
                break;
              case ConnectionState.waiting:
                print('snapshot waiting');
                break;
              case ConnectionState.active:
                print('snapshot active');
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  print('snapshot error ====>  ${snapshot.error}');
                }
                break;
            }
            if (snapshot.hasData) {
              List<Map> bannerData = (snapshot.data['data']['list'] as List).cast();
              return Column(
                children: <Widget>[
                  HomePageBanner(bannerList: bannerData),
                  TopNavgator(navgatorItemList: _topNavData())
                ],
              );
            } else {
              return Center(
                child: Text('banner 数据加载中。。。'),
              );
            }
          },
        ),
      ),
    );
  }

  // 获取topNavdata
  List _topNavData(){
    List topNavData;
    getTopNavListData().then((value){
      print(value['data']);
      topNavData = (value['data']['list'] as List).cast();
    });
    return topNavData;
  }
}


/*
 * 轮播控件
 */

class HomePageBanner extends StatelessWidget {

  final List bannerList;
  // 构造方法
  // 写法1: 官方推荐写法， key 代表 一个参数，调用 super 传递给父类
  HomePageBanner({Key key, this.bannerList}):super(key:key);

  // 写法2: 
  // HomePageBanner({this.bannerList});
  
  @override
  Widget build(BuildContext context) {
    // TODO: 初始化设计尺寸
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.getInstance().setHeight(300),
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (context, index){
          // 对象使用{}
          return Image.network("${bannerList[index]['banner_cover']}", fit: BoxFit.fill);
        },
        // banner 指示器
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}


/**
 * 九宫格控件
 */

class TopNavgator extends StatelessWidget {
  final List navgatorItemList;
  TopNavgator({Key key, this.navgatorItemList}) : super(key: key);
  // 自定义item 控件
  Widget _gridViewItemUI(BuildContext context, item){
    return InkWell(
      onTap: (){print('点击事件');},
      child: Column(
        children: <Widget>[
          Image.network(''),
          Text('测试')
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(100),
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(5.0),
        children: navgatorItemList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:app_flutter/config/serviceUrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/service/service_data.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/*
 * TODO: 保持页面状态 AutomaticKeepAliveClientMixin
 * - 页面必须是StatefulWidget,不能是StatelessWidget否则无法使用。
 * - 两个前置组件才能保持页面状态：PageView和IndexedStack。
 * - 重写wantKeepAlive方法，返回为true
 */ 

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  
  int page = 1;
  int pagSize=6;
  String homePageContent='加载中...';
  
  List<Map> bannerData;
  List<Map> topNavData;
  List<Map> newProductData;
  List<Map> recommendData;
  List<Map> excellentData=[];
  
  // 保持页面状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {

    getNewProductListData().then((val){
      var fakeData = json.decode(fakenewProduct.toString());
      newProductData=(fakeData['data']['list'] as List).cast();
    });

    getRecommendList().then((val){
      if (val!=null) {
        recommendData=(val['data']['list'] as List).cast();
      }
    });

    _getExcellentListData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(),
      body: FutureBuilder(
              future: getGeekBannerListData(),
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
                  List<Map> topNavgatorData = (snapshot.data['data']['list'] as List).cast();
                  // TODO: 需要给整体添加下拉刷新
                  // 使用 EasyRefresh， 要求必须是一个ListView
                  return EasyRefresh(
                    // TODO: 自定义footer https://github.com/xuelongqy/flutter_easyrefresh/blob/v2/document/cn/CUSTOM_HEADER_FOOTER.md
                    child: ListView(
                      children: <Widget>[
                        HomePageBanner(bannerList: bannerData),
                        TopNavgator(navgatorItemList: topNavgatorData),
                        SkillMapSearch(),
                        NewProductWidget(newProductData:newProductData),
                        RecommendWidget(recommendList: recommendData),
                        ExcellentList(excellentData: excellentData)
                      ],
                    ),

                    onRefresh: () async{
                      print('下拉刷新');
                    },

                    // TODO: 加载更多数据
                    onLoad: () async{
                      _getExcellentListData();
                      print('上拉加载-----');
                    },
                  );
                } else {
                  return Center(
                    child: Text('banner 数据加载中。。。'),
                  );
                }
              }
            )
    );
  }

  Widget excellentTitle=Container(
    color: Colors.white,
    margin: EdgeInsets.all(15),
    child: Row(
      children: <Widget>[
        Image.asset("Icons.add_box"),
        Text('优选系列'),
        RaisedButton(
          onPressed: (){
            print('查看全部优选');
          },
          child: Text(
            '全部',
          ),
        )
      ],
    )
  );

  // 获取优选数据
  void _getExcellentListData(){
    var parameters={'page': page, 'pageSize': 6};
    getExcellentList(parameters).then((val){
      if (val!=null) {
        List<Map> data =(val['data']['list'] as List).cast();
        setState(() {
        // sleep(Duration(seconds: 5));
          excellentData.addAll(data);
        });
      }
    });
  }
}


/*
 * 轮播控件
 */

class HomePageBanner extends StatelessWidget {

  final List bannerList;
  //TODO: Dart语言构造方法
  // 写法1: 官方推荐写法， key 代表 一个参数，调用 super 传递给父类, 如果类没有默认构造方法，只有一个命名构造方法，在继承该类时，使用写法1
  HomePageBanner({Key key, this.bannerList}):super(key:key);

  // 写法2: Dart 目前的版本已经支持此写法
  // HomePageBanner({this.bannerList});
  
  @override
  Widget build(BuildContext context) {
    // TODO: 初始化设计尺寸
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(300),
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

/// 技能地图
class SkillMapSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){print('搜索');},
      child: Container(
        height: ScreenUtil().setHeight(60),
        margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Icon(Icons.search),
            ),
            
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text('技能地图', textAlign: TextAlign.left),
            ),
          ],
        ),
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
            Image.network("${item['banner_cover']}", width: ScreenUtil().setHeight(200)),
            Text(
              '${item['banner_title']}',
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 8,
        childAspectRatio: 16/9,
        padding: const EdgeInsets.all(2.0),
        children: navgatorItemList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

/*
 * 新品 
 */

class NewProductWidget extends StatelessWidget {

  final List<Map> newProductData;
  NewProductWidget({this.newProductData});

  Widget _contentWidget(){
    print('data = $newProductData');
    return InkWell(
      splashColor: Colors.blue,
      focusColor: Colors.yellow,
      hoverColor: Colors.red,
      onTap: (){print('点击新品');},
      child: Container(
        padding: EdgeInsets.all(0),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              _imageContent(),
              _newTag(),
            ],
          ),
        )
      ),
    );
  }

  Widget _newTag(){
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 25.0, 0, 0),
      child: Container(
        alignment: Alignment.centerLeft,
        width: ScreenUtil().setWidth(100),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Text('新品'),
        ),
      )
    );
  }

  Widget _imageContent(){
    return Column(
      children: <Widget>[
        Image.network('${newProductData.first['image_url']}'),
        Container(
          padding: EdgeInsets.only(top: 15, left: 15),
          alignment: Alignment.centerLeft,
          child: Text(newProductData.first['title'], textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0)),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15),
          child: Text(newProductData.first['sub_title'], 
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12.0, color: Colors.black45)
          ),
        )
      ],
    );
  }

  Widget _priceWidget(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${newProductData.first['price']}', 
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18.0, color: Colors.orange)
          ),
          Icon(Icons.shopping_cart, color: Colors.orange)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _contentWidget(),
          _priceWidget()
        ],
      ),
    );
  }
}


/*
 * 极客推荐
 */

class RecommendWidget extends StatelessWidget {

  final List<Map> recommendList;
  RecommendWidget({this.recommendList});

  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft, // 靠左中间对齐
      padding: EdgeInsets.fromLTRB(15.0, 2.0, 15, 2.0),
      // 盒子样式
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border(
          // 设置底部分割线
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      child: Text(
        '极客推荐',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18.0
        )
      ),
    );
  }

  Widget _recommendItem(index){
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil.getInstance().setWidth(250),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12),
          )
        ),

        child: Column(
          children: <Widget>[
            Image.network('${recommendList[index]['image_url']}'),
            Text('${recommendList[index]['title']}'),
            Text('${recommendList[index]['price']}', style: TextStyle(color: Colors.orange), textAlign: TextAlign.left),
            Text('${recommendList[index]['origin']}', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey))
          ],
        ),
      ),
    );
  }

  Widget _recommendList(){
    return Container(
      //TODO: ListView 需要指定高度
      height: ScreenUtil.getInstance().setHeight(420),
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (BuildContext context, int index){
          return _recommendItem(index);
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }
}


/*
 * 优选系列 
 * TODO: flutter 中实现上拉加载更多，redux、bloc、state、Provide
 */


class ExcellentList extends StatefulWidget {
  // TODO: 在 StatefulWidget 中定义变量

  // 优选数据
  List<Map> excellentData = [];
  ExcellentList({this.excellentData});

  @override
  _ExcellentListState createState() => _ExcellentListState();
}

class _ExcellentListState extends State<ExcellentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _excentTitleWidget(),
          _wrapList()
        ],
      ),
    );
  }
  // 优选标题控件
  Widget _excentTitleWidget(){
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: <Widget>[
          Icon(Icons.mail),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('优选系列'),
          ),
          
          Padding(
            padding: EdgeInsets.all(0),
            child: Text('全部'),
          ),
          
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
  
  Widget _wrapList(){
    // TODO: 在 state 中通过 Widget 使用变量
    if (widget.excellentData == null || widget.excellentData.length <= 0) {
      return Text('优选数据为空');
    } 

    List<Widget> listWidget = widget.excellentData.map((value){
      return InkWell(
        onTap: (){
          print('点击了_wrapList---'); 
        },

        child: Container(
          width: ScreenUtil().setHeight(372),
          color: Colors.white,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(bottom: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // TODO: 处理左对齐方式一：使用 CrossAxisAlignment.start
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(value['image_url']),
              Padding(
                padding: EdgeInsets.all(10),
                
                // TODO: 处理左对齐方式二：Align 然后设置具体的某一个控件的对齐方式，控制更灵活
                // child: Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(value['title']),
                // )
                child: Text(value['title'])
              ),
              
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
                    child: Text('¥${value['price']}',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 15, 5),
                    child: Icon(Icons.shopping_cart, color: Colors.orange),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }).toList();

    return Wrap(
      spacing: 2,
      children: listWidget
    );
  }
}

// appBar
Widget homePageAppBar(){
  return AppBar(
      title: Text('首页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone_in_talk),
            onPressed: _call,
          )
        ],
    );
}

// 打电话
void _call() async {
  String tel = 'tel: 1-408-555-5555';
  if (await canLaunch(tel)) {
    await launch(tel);
  } else {
    throw '不能使用打电话功能';
  }
}

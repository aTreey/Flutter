import 'dart:convert';

import 'package:app_flutter/config/serviceUrl.dart';
import 'package:app_flutter/model/recommend.dart';
import 'package:app_flutter/provide_state/recommend_provide.dart';
import 'package:app_flutter/service/service_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getRecommendData();
    return Provide<CommunityRecommendProvide>(builder:(context, child, recommendProvide){
      return Container(
        child: ListView.builder(
          itemCount: recommendProvide.recommendList.length,
          itemBuilder: (context, index){
            return RecommendItemWidget(item: recommendProvide.recommendList[index]);
          },
        ),
      );
    });
  }

  Future getRecommendData() async {
      
  }

  void _getRecommendData(){
    // getCommunityData().then((val){
    //   print(val);
    // });

    var fakeRecommendData=json.decode(recommendJsonData.toString());
    RecommendModel recommendModel=RecommendModel.fromJson(fakeRecommendData);
    print('recommendModel = $recommendModel');
    Provide.value<CommunityRecommendProvide>(context).getRecommendList(recommendModel.data.results);
  }
}

class RecommendItemWidget extends StatefulWidget {
  RecommendModelDataResults item;
  RecommendItemWidget({this.item});
  @override
  _RecommendItemWidgetState createState() => _RecommendItemWidgetState();
}

class _RecommendItemWidgetState extends State<RecommendItemWidget> {  
  var titleTextStyle = TextStyle(fontFamily: 'PingFangSC-Semibold',color: Color(0xFF2F2F2F), fontSize: ScreenUtil().setSp(28));
    var timeTextStyle = TextStyle(fontFamily: 'PingFang', color: Color(0xFF999999), fontSize: ScreenUtil().setSp(20));
    var detailTitleTextStyle = TextStyle(color: Color(0xFF2F2F2F), fontSize: ScreenUtil().setSp(32));
    var contentTextStyle = TextStyle(color: Color(0xFF656565), fontSize: ScreenUtil().setSp(30));
    var bottomTextStyle = TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(28));

    // 顶部头像相关
    Widget profilePanelWidget(RecommendModelDataResults item){
      var releaseTime = DateTime.fromMillisecondsSinceEpoch(item.releaseTime).toString();
      return Padding(
        padding: EdgeInsets.all(0),
        // EdgeInsets.only(left: 15, top: 13),
        child: Container(
          // color: Colors.cyan,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 13),
            child: Row(
            children: <Widget>[
              Container(
                child:InkWell(
                  onTap: (){
                    print('头像点击');
                  },
                  child: ClipOval(
                    child: Image.network(item.avatar, width: 60, height: 60),
                  ),
                ),
              ),
              
              
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.nickname, style: titleTextStyle, textAlign: TextAlign.left),
                    Text(releaseTime, style: timeTextStyle, textAlign: TextAlign.left)
                    ],
                  )
                )
              ],
            ),
          )
        )
      );
    } 

    // 中间内容
    Widget contentDetailWidget(RecommendModelDataResults item){
      return Padding(
        padding: EdgeInsets.fromLTRB(15, 11, 15, 0),
        child: Container(
          // color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 11),
                child: Text(item.title, maxLines: 3, overflow: TextOverflow.ellipsis, style: detailTitleTextStyle),
              ),

              Padding(
                padding: EdgeInsets.only(top: 11),
                child: Text(item.content, maxLines: 3, overflow: TextOverflow.ellipsis, style: contentTextStyle),
              ),
              Image.network('https://p.ampmake.com/lixiangzhizao_app/cab69bc021d18beba25057b760a6f4dd/1568189503047.jpeg')
            ],
          ),
        )        
      );
    }

    Widget bottomWidget(RecommendModelDataResults item){
      return Padding(
        padding: EdgeInsets.fromLTRB(12.5, 12.5, 15, 15),
        child: Container(
          // color: Colors.redAccent,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: (){
                  
                },

                child: Row(
                  children: <Widget>[
                    Icon(Icons.grade, color: Colors.blue, size: 20),
                    Text(item.favourSum.toString(), style: bottomTextStyle),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                    
                      },
                    child: Row(
                      children: <Widget>[
                          Icon(Icons.tag_faces, color: Colors.blue, size: 20),
                          Text(item.collectSum.toString(), style: bottomTextStyle),
                        ],
                      ),
                    )
                  )
                ),

              InkWell(
                onTap: (){
                  
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.more_horiz, color: Colors.grey[800], size: 20)  
                  ],
                ),
              ),
            ]
          ),
        )
      );
    }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          profilePanelWidget(widget.item),
          contentDetailWidget(widget.item),
          bottomWidget(widget.item)
        ],
      ),
    );
  }
}
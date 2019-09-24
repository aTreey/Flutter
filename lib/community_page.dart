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
    var titleTextStyle = TextStyle(fontFamily: 'PingFangSC-Semibold', fontWeight: FontWeight.bold, color: Color(0xFF2F2F2F), fontSize: ScreenUtil().setSp(34));
    var timeTextStyle = TextStyle(fontFamily: 'PingFang', color: Color(0xFF999999), fontSize: ScreenUtil().setSp(20));
    var detailTitleTextStyle = TextStyle(color: Color(0xFF2F2F2F), fontSize: ScreenUtil().setSp(32));
    var contentTextStyle = TextStyle(color: Color(0xFF656565), fontSize: ScreenUtil().setSp(30));
    var bottomTextStyle = TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(28)); 

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

    Widget articleBottomWidget(RecommendModelDataResults item){
      return Padding(
        padding: EdgeInsets.fromLTRB(12.5, 12.5, 15, 15),
        child: Container(
          // color: Colors.redAccent,
          child: Row(
            children: <Widget>[
              Text(item.nickname.toString(), style: bottomTextStyle),
              Text(DateTime.fromMillisecondsSinceEpoch(item.releaseTime).toString(), style: bottomTextStyle),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                      children: <Widget>[
                        Text('浏览' + item.browseSum.toString(), style: bottomTextStyle),
                        Text('评论' + item.commentSum.toString(), style: bottomTextStyle)
                      ],
                  ),
                )
              ),
            ]
          ),
        )
      );
    }

    /// 文章
    // M01CommunityTypeContentArticle = 1,
    // /// 图文
    // M01CommunityTypeContentImageText = 2,
    // /// 视频
    // M01CommunityTypeContentVideo = 3,
    // /// 专题
    // M01CommunityTypeContentSpecial = 4,
    // /// 图文问题
    // M01CommunityTypeQuestionImageText = 6,
    // /// 视频问题
    // M01CommunityTypeQuestionVideo = 7,
    // /// 图文回答
    // M01CommunityTypeAnswerImageText = 8,
    // /// 视频回答
    // M01CommunityTypeAnswerVideo = 9,
    // /// 话题
    // M01CommunityTypeContentTopic = 15,
    // /// 推荐用户
    // M01CommunityTypeRecommendUser = 66,
    // /// 运营活动
    // M01CommunityTypeEvent = 100,

  Widget operationWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          AvatarItemWidget(
            imageUrl:data.avatar, 
            nickName: data.nickname, 
            releaseTime: DateTime.fromMillisecondsSinceEpoch(data.releaseTime).toString()),
          contentDetailWidget(widget.item),
          // ImagesDisPlayWidget(urls: data.imageUrls),
          bottomWidget(widget.item)
        ],
      ),
    );
  }

  Widget articleWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(data.title, style: titleTextStyle, textAlign: TextAlign.left),
          ),
          Image.network('https://p.ampmake.com/lixiangzhizao_app/cab69bc021d18beba25057b760a6f4dd/1568189503047.jpeg'),
          articleBottomWidget(data)
        ],
      ),
    );
  }

  Widget imageTextWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          AvatarItemWidget(
            imageUrl:data.avatar, 
            nickName: data.nickname, 
            releaseTime: DateTime.fromMillisecondsSinceEpoch(data.releaseTime).toString()),
          contentDetailWidget(widget.item),
          // ImagesDisPlayWidget(urls: data.imageUrls),
          bottomWidget(widget.item)
        ],
      ),
    );
  }

  Widget videoWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          AvatarItemWidget(
            imageUrl:data.avatar, 
            nickName: data.nickname, 
            releaseTime: DateTime.fromMillisecondsSinceEpoch(data.releaseTime).toString()),
          contentDetailWidget(widget.item),
          // ImagesDisPlayWidget(urls: data.imageUrls),
          bottomWidget(widget.item)
        ],
      ),
    );
  }

  Widget specialWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          AvatarItemWidget(
            imageUrl:data.avatar, 
            nickName: data.nickname, 
            releaseTime: DateTime.fromMillisecondsSinceEpoch(data.releaseTime).toString()),
          contentDetailWidget(widget.item),
          // ImagesDisPlayWidget(urls: data.imageUrls),
          bottomWidget(widget.item)
        ],
      ),
    );
  }

  Widget questionImageTextWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          AvatarItemWidget(
            imageUrl:data.avatar, 
            nickName: data.nickname, 
            releaseTime: DateTime.fromMillisecondsSinceEpoch(data.releaseTime).toString()),
          contentDetailWidget(widget.item),
          // ImagesDisPlayWidget(urls: data.imageUrls),
          bottomWidget(widget.item)
        ],
      ),
    );
  }

  Widget answerImageTextWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          AvatarItemWidget(
            imageUrl:data.avatar, 
            nickName: data.nickname, 
            releaseTime: DateTime.fromMillisecondsSinceEpoch(data.releaseTime).toString()),
          contentDetailWidget(widget.item),
          // ImagesDisPlayWidget(urls: data.imageUrls),
          bottomWidget(widget.item)
        ],
      ),
    );
  }

  Widget topicWidget(RecommendModelDataResults data){
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: <Widget>[
          AvatarItemWidget(
            imageUrl:data.avatar, 
            nickName: data.nickname, 
            releaseTime: DateTime.fromMillisecondsSinceEpoch(data.releaseTime).toString()),
          contentDetailWidget(widget.item),
          // ImagesDisPlayWidget(urls: data.imageUrls),
          bottomWidget(widget.item)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RecommendModelDataResults data = widget.item;    
    if (data.type == 100) {
      return operationWidget(data); 
    } else if (data.type == 1) {
      return articleWidget(data);
    } else if (data.type == 2) {
      return imageTextWidget(data);
    } else if (data.type == 3) {
      return videoWidget(data);
    } else if (data.type == 4) {
      return specialWidget(data);
    } else if (data.type == 6) {
      return questionImageTextWidget(data);
    } else if (data.type == 7) {
      return answerImageTextWidget(data);
    } else if (data.type == 8) {
      return articleWidget(data);
    } else if (data.type == 9) {
      return articleWidget(data);
    } else if (data.type == 15) {
      return topicWidget(data);
    } else {
      return Text('未知类型');
    }
  }
}



class ImagesDisPlayWidget extends StatelessWidget {
  final List urls;
  ImagesDisPlayWidget({this.urls});
  List<Widget> photoWidget(urls) {
    List<Widget> widgets=[];
    for (var url in urls) {
      widgets.add(
        Container(
          width: ScreenUtil().setWidth(200),
          height: ScreenUtil().setHeight(200),
          color: Colors.yellow,
          child: Image.network(url.toString()),
        )
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    if (urls.length == 0) {
      return Text('无图片');
    } else {
      return Container(
        color: Colors.greenAccent,
        child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: urls.length,
          mainAxisSpacing: 10,  // 上下间距
          crossAxisSpacing: 10, // 左右间距
          children: photoWidget(this.urls),
        ),
      );
    }
  }
}

class AvatarItemWidget extends StatelessWidget {
  final String imageUrl;
  final String nickName;
  final String releaseTime;

  const AvatarItemWidget({this.imageUrl, this.nickName, this.releaseTime});

  @override
  Widget build(BuildContext context) {
  var titleTextStyle = TextStyle(fontFamily: 'PingFangSC-Semibold',color: Color(0xFF2F2F2F), fontSize: ScreenUtil().setSp(28));
  var timeTextStyle = TextStyle(fontFamily: 'PingFang', color: Color(0xFF999999), fontSize: ScreenUtil().setSp(20));
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
            children: <Widget>[
              Container(
                child:InkWell(
                  onTap: (){
                    print('头像点击');
                  },
                  child: ClipOval(
                    child: Image.network(this.imageUrl, width: 60, height: 60),
                  ),
                ),
              ),
              
              
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.nickName, style: titleTextStyle, textAlign: TextAlign.left),
                    Text(releaseTime, style: timeTextStyle, textAlign: TextAlign.left)
                    ],
                  )
                )
              ],
            ),
      ),
    );
  }
}
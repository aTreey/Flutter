import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/service/service_data.dart';

class TestPage extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<TestPage> {

  TextEditingController typeController = TextEditingController();
  String showTextStr = '欢迎使用';
  String helperTextStr = '您输入的文字将作为请求参数请求接口数据';

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求测试'),
      ),

//TODO: 解决越界警告⚠️的问题
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // 
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  // icon: Icon(Icons.search),
                  labelText: '请输入内容',
                  helperText: helperTextStr,
                ),
                autofocus: false,
              ),

              RaisedButton(
                onPressed: _geekH5TopNavList,
                child: Text('极客邦商城导航数据'),
              ),
              RaisedButton(
                onPressed: _geeKBangBannerList,
                child: Text('获取极客邦banner数据'),
              ),

              // 头获取极客时间首页
              RaisedButton(
                onPressed: _geekBang,
                child: Text('伪装请求头获取极客时间首页数据'),
              ),
              
              // 选择按钮
              RaisedButton(
                onPressed: _choiceAction,

                child: Text('点击请求网络'),
              ),

              Text(
                showTextStr,
                // overflow: TextOverflow.ellipsis,
                // maxLines: 2,
              )
            ],
          )
        ),
      )
    );
  }

  void _geekH5TopNavList(){
    getTopNavListData().then((value){
      setState(() {
        showTextStr=value['data'].toString();
      });
    });
  }

  void _geeKBangBannerList(){
    getGeekBangListData().then((value){
      setState(() {
        helperTextStr='网络请求成功';
        showTextStr=value['data'].toString();
      });
    });
  }

  void _geekBang(){
    getGeekNewAllData().then((val){
      setState(() {
        showTextStr=val['data'].toString();
      });
    });
  }

  void _choiceAction(){
    print('开始选择');
    // 判断文本内容是否为空
    if (typeController.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('类型不能为空'),
        )
      );
    } else {
      getHttp(typeController.text.toString()).then((result){
        print(result);
        setState(() {
          showTextStr=result['data']['name'].toString();
        });
      });
    }
  }
}

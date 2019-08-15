import 'package:app_flutter/provide_state/counter_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/service/service_data.dart';
import 'package:provide/provide.dart';

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

              // 头获取极客时间首页
              RaisedButton(
                onPressed: _geekBang,
                child: Text('伪装请求头获取极客时间首页数据'),
              ),

              // ListView.builder(
              //   itemCount: 1,
              //   itemBuilder: (context, index){
              //     return Text(
              //       showTextStr,
              //       overflow: TextOverflow.ellipsis,
              //       maxLines: 2,
              //     );
              //   }
              // ),

              Text(
                    showTextStr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
              ),

              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: <Widget>[
                    CounterWidget(),
                    CounterButtonWidget()
                  ],
                ),
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
    getGeekBannerListData().then((value){
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



// 使用 provide 进行状态管理

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // TODO: 状态管理---获取状态
      
      child: Provide<Counter>(
        builder: (context, child, counter){
          return Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.display1,
          );
        },
      ),
    );
  }
}

class CounterButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){ 
          // TODO: 状态管理---修改状态
          Provide.value<Counter>(context).addValue();
        },
        child: Text('点击+1'),
      ),
    );
  }
}
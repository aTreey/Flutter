import 'package:app_flutter/mockData/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('社区'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              // 展示搜索控件
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
         child: Text('社区页面内容'),
      ),
    );
  }
}


/// 继承 SearchBarDelegate
class SearchBarDelegate extends SearchDelegate<String>{

  // 实现代理方法
  // 点击搜索时
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: ()=>query = "",
    )];
  }
  
  // 搜索框左边的按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,
        ),

        // 关闭搜索页面，
        onPressed: ()=>close(context, null),
      );
  }

  // 搜索结果页面组件
  @override
  Widget buildSuggestions(BuildContext context) {
    final topSearch = query.isEmpty ? topSearchList : searchList.where((input)=>input.startsWith(query)).toList();
    
    return ListView.builder(
      itemCount: topSearch.length,
      // 设置搜索结果中每条记录
      itemBuilder: (context, index)=>ListTile(
        // 设置富文本属性
        title: RichText(
          text: TextSpan(
            // 匹配成功的文字
            text: topSearch[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),

            // 未匹配成功的
            children: [
              TextSpan(
                text: topSearch[index].substring(query.length),
                style: TextStyle(
                  color: Colors.black38
                )
              )
            ]
          ),
          // textAlign: TextAlign.left,
          // 设置文本显示方向，阿拉伯从右往左
          // textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

  @override 
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }
}
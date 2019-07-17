import 'package:flutter/material.dart';

/*
 * 可展开控件
 */

// 状态管理
class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.isOpen, this.index);
}

// 展开demo
class ExpandListDemo extends StatefulWidget {
  @override
  _ExpandListDemoState createState() => _ExpandListDemoState();
}

class _ExpandListDemoState extends State<ExpandListDemo> {
  var currentIndex = -1;
  List<int> list;
  List<ExpandStateBean> expandStateList;

  // 构造方法中初始化
  _ExpandListDemoState(){
    list = List();
    expandStateList = List();

    // 初始化数据
    for (var i = 0; i < 20; i++) {
      list.add(i);
      expandStateList.add(ExpandStateBean(false, i));
    }
  }

  _setCurrentIndex(bool isExpand, int index){
    setState(() {
      
      // expandStateList[index].isOpen = !isExpand;
      expandStateList.forEach((item){
        if (item.index==index) {
          item.isOpen= !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isOpen){
            _setCurrentIndex(isOpen, index);
          },

          children: list.map((idx){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded){
                return ListTile(
                  title: Text('headerBuilder -- $idx'),
                );
              },
              
              body: ListTile(
                title: Text('expand - Body-- $idx'),
              ),
              isExpanded: expandStateList[idx].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}

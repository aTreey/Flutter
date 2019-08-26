import 'package:flutter/material.dart';

// TODO: Provide 状态管理的使用
// 0. 添加provide 依赖库
// 1. 创建 provide, 混入 ChangeNotifier 不用在乎监听者
// 2. 需要在main 绑定两者关系
// 3. 获取状态
class CounterProvide with ChangeNotifier {
  int value = 0;
  addValue(){
    value++;
    // 通知监听者以更新界面
    notifyListeners();
  }
}
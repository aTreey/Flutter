import 'package:app_flutter/flutter_study/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';

class LaunchAnimation extends StatefulWidget {
  @override
  _LaunchAnimationState createState() => _LaunchAnimationState();
}

/*
with是dart的关键字，意思是混入的意思，
就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
避免多重继承导致的问题。
SingleTickerProviderStateMixin 主要是我们初始化TabController时，
需要用到vsync ，垂直属性，然后传递this
 */
class _LaunchAnimationState extends State<LaunchAnimation> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;
  Animation _animation;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animation.addStatusListener((status){
      if (status==AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>BottomNavigationWidget()), 
          (route)=>route==null);
      }
    });

    // 播放动画
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(// 动画控件
      // 透明度转换
      opacity: _animation,
      child: Image.asset('lib/assets/ideaOne.png',
        scale: 1.5,
        fit: BoxFit.contain,
      ),
    );
  }
}

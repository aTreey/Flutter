/**
 * 需要继承 PageRouterBuilder，然后重写父类的CustomRoute构造方法
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {

  final Widget widget;

  CustomRoute(this.widget)
    :super(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder:(BuildContext context, Animation<double> animation1, Animation<double> animation2){
        return widget;
      },

      transitionsBuilder:(
        BuildContext context, 
        Animation<double> animation1, 
        Animation<double> animation2, 
        Widget child){

          // return FadeTransition(
          //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          //     parent: animation1,
          //     curve: Curves.fastOutSlowIn
          //   )),

          //   child: child,
          // );

          // return ScaleTransition(
          //   scale: Tween(begin: 0.0, end: 1.0).animate(
          //     CurvedAnimation(
          //       parent: animation1,
          //       curve: Curves.fastOutSlowIn,
          //     ),
          //   ),
          //   child: child,
          // );


          return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn,
          )
        ),

        child: ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0)
          .animate(
            CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
      );

      }
    );

    _initFadeTransition(Animation<double> animation1, Widget child){
      return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),

          child: child,
        );
    }
    
    _initScaleAnimation(Animation<double> animation1, Widget child){
      return ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: child,
      );
    }

    _initRotatioAndScaleAnimation(Animation<double> animation1, Widget child){
      return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn,
          )
        ),

        child: ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0)
          .animate(
            CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
      );
    }
}


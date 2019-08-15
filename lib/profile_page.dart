import 'package:app_flutter/provide_state/counter_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Provide<Counter>(
        //   builder: (context, child, counter){
        //     return Text(
        //       '通过provide获取的数据为${counter.value}', 
        //       style: Theme.of(context).textTheme.display1
        //     );
        //   },
        // ),
      ),
    );
  }
}
import 'package:app_flutter/service/service_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  @override
  void initState() {
    // TODO: implement initState
    // _getRecommendData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CommunityPage'),
      ),
    );
  }

  void _getRecommendData(){
    getCommunityData().then((val){
      print(val);
    });
  }
}

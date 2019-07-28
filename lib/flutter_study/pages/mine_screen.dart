
import 'package:app_flutter/flutter_study/select_photo.dart';
import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return SelectPhotoWidget();
              }));
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
         child: Text('我--内容'),
      ),
    );
  }
}
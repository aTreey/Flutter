import 'package:flutter/material.dart';

class BezierPathDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: BottomClipperTest(),
        child: Container(
          height: 100,
          color: Colors.purple,
        ),
      ),
    );
  }
}

class BottomClipperTest extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    var path = Path();
    // path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);
    
    var controlPoint1 = Offset(size.width/4, size.height);
    var endPoint1 = Offset(size.width/2, size.height-30);
    
    path.quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    var controlPoint2 = Offset(size.width/4*3, size.height-60);
    var endPoint2 = Offset(size.width, size.height-10);
    path.quadraticBezierTo(controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
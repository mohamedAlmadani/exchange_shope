import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class HeaderContainer extends StatelessWidget {
  var text = "Login";


  HeaderContainer({this.text});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Stack(
     children: [
       Container(
         height: 300.h,
         decoration: BoxDecoration(
             gradient: LinearGradient(
                 colors: [blueColors, blueLightColors],
                 end: Alignment.bottomCenter,
                 begin: Alignment.topCenter),
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
         child: Stack(
           children: <Widget>[
             Positioned(
                 bottom: 30,
                 right: 30,
                 child: Text(
                   text,
                   style: TextStyle(color: Colors.white,fontSize: 20),
                 )),
             Center(
               child: Image.asset("assets/images/logo.png"),
             ),

           ],
         ),
       ),
     ],
    );
  }
}

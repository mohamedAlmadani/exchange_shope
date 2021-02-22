import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  var btnText ="";
  var onClick;


  ButtonWidget({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 320.w,
        height: 40.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [blueColors, blueLightColors],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
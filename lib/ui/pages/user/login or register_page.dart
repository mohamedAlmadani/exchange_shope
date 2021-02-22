import 'package:exchange_shop/ui/pages/user/loginPage.dart';
import 'package:exchange_shop/ui/pages/user/register_page.dart';
import 'package:exchange_shop/ui/widget/ButtonWidget.dart';
import 'package:exchange_shop/ui/widget/herder_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class loginOrRigester extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(text: 'Welcome',),
            SizedBox(height: 140.h,),

            Center(
              child: ButtonWidget(
                onClick: () {
                  Get.off(loginPage());


                },
                btnText: "LOGIN",
              ),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: ButtonWidget(
                onClick: () {
                  Get.off(ResgisterPage());

                },
                btnText: "REGISTER",
              ),
            ),


          ],
        ),
      ),
    );
  }
}

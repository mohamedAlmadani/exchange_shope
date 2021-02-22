import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/ui/widget/ButtonWidget.dart';
import 'package:exchange_shop/ui/widget/CustomTextFiled.dart';
import 'package:exchange_shop/ui/widget/herder_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class loginPage extends StatelessWidget {
  String Email;
  String password;
  saveEmail(String email) {
    this.Email = email;
  }
  savePassword(String password) {
    this.password = password;
  }


  nullValidation(String value) {
    if (value == '') {
      return 'required field';
    }
  }
  GlobalKey<FormState> formKeylogin = GlobalKey();
  saveForm(){
    if(formKeylogin.currentState.validate()){
      formKeylogin.currentState.save();
      signInUsingEmailAndPassword(this.Email,this.password);
    } else{
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);


    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              HeaderContainer(text: 'Login'),
              SizedBox(height: 30.h,),
              Form(
                key: formKeylogin,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomTextField(hint: 'Email',icon: Icons.email, saveFun: saveEmail,),
                  SizedBox(height: 10.h,),
                  CustomTextField(hint: 'Password',icon: Icons.vpn_key,saveFun: savePassword,),

                ],
                  ),


                ),
              ),
              SizedBox(height: 10.h,),
              Center(
                child: ButtonWidget(
                  onClick: () {
                    saveForm();

                  },
                  btnText: "LOGIN",
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

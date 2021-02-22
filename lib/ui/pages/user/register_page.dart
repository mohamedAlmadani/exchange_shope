import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/model/AppUser.dart';
import 'package:exchange_shop/ui/pages/user/homepage_navbar.dart';
import 'package:exchange_shop/ui/widget/ButtonWidget.dart';
import 'package:exchange_shop/ui/widget/CustomTextFiled.dart';
import 'package:exchange_shop/ui/widget/herder_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResgisterPage extends StatefulWidget {
  @override
  _ResgisterPageState createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  String Name;
  String Email;
  String Address;
  String PhoneNumber;
  userType type;
  String password;
  saveEmail(String email) {
    this.Email = email;
  }

  saveName(String name) {
    this.Name = name;
  }

  saveAddress(String address) {
    this.Address = address;
  }

  savePhoneNumber(String phoneNumber) {
    this.PhoneNumber = phoneNumber;
  }

  savePassword(String password) {
    this.password = password;
  }

  nullValidation(String value) {
    if (value == '') {
      return 'required field';
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  saveForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      saveUserInFirebase({
        'password': this.password,
        'PhoneNumber': this.PhoneNumber,
        'Email': this.Email,
        'Name': this.Name,
        'Address': this.Address,
      });
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
            HeaderContainer(text: 'Register',),
            Form(
              key: formKey,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTextField(
                      hint: 'Name',
                      icon: Icons.person,
                      saveFun: saveName,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextField(
                      hint: 'Email',
                      icon: Icons.email,
                      saveFun: saveEmail,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextField(
                      hint: 'Phone Number',
                      icon: Icons.call,
                      saveFun: savePhoneNumber,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextField(
                      hint: 'Address',
                      icon: Icons.place_outlined,
                      saveFun: saveAddress,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextField(
                      hint: 'Password',
                      icon: Icons.vpn_key,
                      saveFun: savePassword,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: ButtonWidget(
                onClick: () {
                  saveForm();
                  Get.to(HomeNavigationBar());
                },
                btnText: "REGISTER",
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
